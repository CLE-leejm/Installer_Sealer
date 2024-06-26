Section ".NET Framework 3.5, 4.7 활성화"
  SectionIn RO
  SetOverwrite try
  nsExec::ExecToStack 'dism /online /enable-feature /featurename:NetFx3 /All /NoRestart'
  Pop $0 ; 결과 상태 코드
  Pop $1 ; 출력 문자열

  ; 결과와 출력을 상세 정보에 표시
  DetailPrint "DISM 결과 상태 코드: $0"
  DetailPrint "DISM 출력: $1"

  SetOutPath "$INSTDIR\tmp_files"
  # .NET Framework 4.7 확인 및 설치
  File "extra files\ndp472-kb4054530-x86-x64-allos-enu.exe"
  Call CheckNetFramework47

SectionEnd