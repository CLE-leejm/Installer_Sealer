!include "utils\check_dotnet.nsh"
!include "utils\version_check.nsh"
!include "utils\external program.nsh"
!include "utils\edit_system_path.nsh"
!include "utils\check_programs.nsh"

# 미리 필요한 함수를 실행 시킨다.
Function .onInit
  # Version Check
  MessageBox MB_OK "프로그램 버전 체크"
  Call cle_version_chekc_test

  #환경변수 세팅
  MessageBox MB_OK "환경변수 세팅"
  Call add_sys_path

  #외부 프로그램 실행
  MessageBox MB_OK "Css Activate  스크립트 실행"
  Call css_activate
FunctionEnd