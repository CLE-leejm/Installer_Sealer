Function un.CheckCleProgram
    StrCpy $0 "" ; 초기 문자열 변수 설정

    ; 레지스트리에서 프로그램 설치 여부 확인
    ; ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CLE_Sealer" "DisplayName"
    ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FineLocalizer" "DisplayName"
    StrCmp $0 "" not_found1
    ; MessageBox MB_OK "FineLocalizer 프로그램이 설치되어 있습니다."
    Goto done
    not_found1:
    ; MessageBox MB_OK "FineLocalizer 프로그램이 설치되어 있지 않습니다."

    ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CalibrationTool" "DisplayName"
    StrCmp $0 "" not_found2
    ; MessageBox MB_OK "CalibrationTool 프로그램이 설치되어 있습니다."
    Goto done
    not_found2:
    ; MessageBox MB_OK "CalibrationTool 프로그램이 설치되어 있지 않습니다."

    ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SealerInspectionVisionSystem" "DisplayName"
    StrCmp $0 "" not_found3
    ; MessageBox MB_OK "SealerInspectionVisionSystem 프로그램이 설치되어 있습니다.."
    Goto done
    not_found3:
    ; MessageBox MB_OK "SealerInspectionVisionSystem 프로그램이 설치되어 있지 않습니다."

    ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PrimerInspectionVisionSystem" "DisplayName"
    StrCmp $0 "" not_found4
    ; MessageBox MB_OK "PrimerInspectionVisionSystem 프로그램이 설치되어 있습니다.."
    Goto done
    not_found4:
    ; MessageBox MB_OK "PrimerInspectionVisionSystem 프로그램이 설치되어 있지 않습니다."
    
    MessageBox MB_OK "프로그램이 설치되어 있지 않습니다. 모든 CLE 프로그램을 삭제합니다."
    ; ---------- 공용 PATH 및 공용 폴더 조건 삭제 ---------- start
    EnVar::DeleteValue "PATH" "C:\CLE\CommonLibs"
    Pop $0
    DetailPrint "EnVar::DeleteValue returned=|$0|"

    EnVar::Delete "CLE_COMMON_LIBS"
    Pop $0
    DetailPrint "EnVar::Delete returned=|$0|"
    ; 삭제 PATH 잘 확인할 것 !!!
    RMDir /r "C:\CLE\Commonlibs"
    RMDir /r "C:\CLE"
    ; ---------- 공용 PATH 및 공용 폴더 조건 삭제 ---------- end
    done:
FunctionEnd