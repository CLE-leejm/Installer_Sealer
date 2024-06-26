!include "StrFunc.nsh"
!include "MUI2.nsh"
Var CurrentVersion
Var NewVersion
Var result_VersionCheck


!macro VersionCheckV5 Ver1 Ver2 OutVar
 Push "${Ver1}"
 Push "${Ver2}"
  Call VersionCheckV5
 Pop "${OutVar}"
!macroend
!define VersionCheckNew "!insertmacro VersionCheckV5"
 
Function VersionCheckV5
 Exch $R0 ; second version number
 Exch
 Exch $R1 ; first version number
 Push $R2
 Push $R3
 Push $R4
 Push $R5 ; second version part
 Push $R6 ; first version part
 
  StrCpy $R1 $R1.
  StrCpy $R0 $R0.
 
 Next: StrCmp $R0$R1 "" 0 +3
  StrCpy $R0 0
  Goto Done
 
  StrCmp $R0 "" 0 +2
   StrCpy $R0 0.
  StrCmp $R1 "" 0 +2
   StrCpy $R1 0.
 
 StrCpy $R2 0
  IntOp $R2 $R2 + 1
  StrCpy $R4 $R1 1 $R2
  StrCmp $R4 . 0 -2
    StrCpy $R6 $R1 $R2
    IntOp $R2 $R2 + 1
    StrCpy $R1 $R1 "" $R2
 
 StrCpy $R2 0
  IntOp $R2 $R2 + 1
  StrCpy $R4 $R0 1 $R2
  StrCmp $R4 . 0 -2
    StrCpy $R5 $R0 $R2
    IntOp $R2 $R2 + 1
    StrCpy $R0 $R0 "" $R2
 
 IntCmp $R5 0 Compare
 IntCmp $R6 0 Compare
 
 StrCpy $R3 0
  StrCpy $R4 $R6 1 $R3
  IntOp $R3 $R3 + 1
  StrCmp $R4 0 -2
 
 StrCpy $R2 0
  StrCpy $R4 $R5 1 $R2
  IntOp $R2 $R2 + 1
  StrCmp $R4 0 -2
 
 IntCmp $R3 $R2 0 +2 +4
 Compare: IntCmp 1$R5 1$R6 Next 0 +3
 
  StrCpy $R0 1
  Goto Done
  StrCpy $R0 2
 
 Done:
 Pop $R6
 Pop $R5
 Pop $R4
 Pop $R3
 Pop $R2
 Pop $R1
 Exch $R0 ; output
FunctionEnd





; Function .onInit
Function cle_version_chekc_test
  SetRegView 64
  ; Set the default installation directory
  ; StrCpy $INSTDIR "C:\CLE\CLE_DEMO_V1"
  ; 새로운 버전 설정, 실제 버전 번호로 교체해야 함
  ;StrCpy $NewVersion "1.0.0.0"
  StrCpy $NewVersion "${PRODUCT_VERSION}"

  ; 레지스트리에서 현재 설치된 버전을 조회
  ;ReadRegStr $CurrentVersion HKLM "Software\Microsoft\Windows\CurrentVersion\CLE_DEMO" "Version"
  ReadRegStr $CurrentVersion HKLM "${PRODUCT_UNINST_KEY}" "DisplayVersion"

  MessageBox MB_OK "PRODUCT_UNINST_KEY = ${PRODUCT_UNINST_KEY}"

  MessageBox MB_OK "Check Version.  $\r$\nCurrentVersion : $CurrentVersion         NewVersion : $NewVersion"

  ; 버전 비교
  ;   0 : Versions are equal 1 : Version 1 is newer (right) 2 : Version 2 is newer (left)
  StrCmp $CurrentVersion "" 0 +2
  StrCpy $CurrentVersion "-1.0.0.0"
  ${VersionCheckNew} $CurrentVersion  $NewVersion  "$result_VersionCheck"



  MessageBox MB_OK "result_VersionCheck {$result_VersionCheck}"


  ${If} $CurrentVersion == ""
      ; 현재 설치된 버전이 없으므로 설치 가능
      ; Goto install
      MessageBox MB_OK "설치된 파일이 없습니다. 설치를 시작합니다."
      ;DetailPrint "설치된 파일이 없습니다. 설치를 시작합니다."
  ${EndIf}
  MessageBox MB_OK "CurrentVersion : $CurrentVersion         NewVersion : $NewVersion    "
  ${If} $result_VersionCheck <= 1
      ; 현재 버전이 새 버전보다 높거나 같다면, 설치 취소
      MessageBox MB_OK "You already have the latest version installed.  $\r$\nCurrentVersion : $CurrentVersion         NewVersion : $NewVersion result_VersionCheck : $result_VersionCheck"
      Abort
  ${EndIf}
  MessageBox MB_OK "현재 버전이 새 버전보다 낮습니다. 설치 시작"
  ;DetailPrint "현재 버전이 새 버전보다 낮습니다. 설치 시작"


  ; Here you could add more initialization code if needed
FunctionEnd
