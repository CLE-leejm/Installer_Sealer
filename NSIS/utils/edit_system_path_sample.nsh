Function add_sys_path
    ;PATH 추가
    EnVar::SetHKLM
    EnVar::AddValue "PATH" "C:\CLE\NSIS_TEST"
    EnVar::AddValue "PATH" "C:\CLE\NSIS_TEST1"
    EnVar::AddValue "PATH" "C:\CLE\NSIS_TEST2"
    EnVar::AddValue "PATH" "C:\CLE\CommonLibs"
    
    ;환경 변수 추가
    EnVar::AddValue "CLE_DEMO_PATH" "C:\CLE\CLE_DEMO_V1_1"
    EnVar::AddValue "CLE_COMMON_LIBS" "C:\CLE\CommonLibs"
    Pop $0
    DetailPrint "EnVar::AddValue returned=|$0|"

FunctionEnd


Function un.remove_sys_path
    ; ----------- PATH 특정 경로 삭제 ----------------
    ; PATH 환경변수 지우기
    EnVar::SetHKLM
    EnVar::DeleteValue "PATH" "C:\CLE\NSIS_TEST"
    EnVar::DeleteValue "PATH" "C:\CLE\NSIS_TEST1"
    EnVar::DeleteValue "PATH" "C:\CLE\NSIS_TEST2"
    Pop $0
    DetailPrint "EnVar::DeleteValue returned=|$0|"
    
    ; ----------- 환경변수 삭제 ----------------
    EnVar::Delete "CLE_DEMO_PATH"
    Pop $0
    DetailPrint "EnVar::Delete returned=|$0|"

FunctionEnd