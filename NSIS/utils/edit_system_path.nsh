Function add_sys_path
    ;PATH 추가
    EnVar::SetHKLM
    EnVar::AddValue "PATH" "C:\CLE\Sealer"
    EnVar::AddValue "PATH" "C:\CLE\Sealer\LIBS"
    
    ;환경 변수 추가

    Pop $0
    DetailPrint "EnVar::AddValue returned=|$0|"

FunctionEnd


Function un.remove_sys_path
    ; ----------- PATH 특정 경로 삭제 ----------------
    ; PATH 환경변수 지우기
    EnVar::SetHKLM


    Pop $0
    DetailPrint "EnVar::DeleteValue returned=|$0|"
    
    ; ----------- 환경변수 삭제 ----------------
    EnVar::DeleteValue "PATH" "C:\CLE\Sealer"
    EnVar::DeleteValue "PATH" "C:\CLE\Sealer\LIBS"
    Pop $0
    DetailPrint "EnVar::Delete returned=|$0|"

FunctionEnd