Function css_activate
    ; copy data
    SetOutPath "$INSTDIR\tmp_files"
    File "active_exe\gtestunit.dll"
    File "active_exe\System.Management.Automation.dll"
    File "active_exe\gtestunit.exe"
    ;CMD SHOW 
    ;ExecWait '"C:\Users\leejm\Desktop\project\2023_1101_nsis\nsis_installer\C#_test1.exe"'
    
    ;CMD HIDE
    ; nsExec::Exec '"C:\Users\leejm\Desktop\project\2023_1101_nsis\nsis_installer\C#_test1.exe"'
    MessageBox MB_OK "Css Activate at $INSTDIR\tmp_files\C#_Active.exe"
    nsExec::Exec "$INSTDIR\tmp_files\gtestunit.exe"
    Pop $0 ; Get the exit code

    ; 외부 프로그램 실행 후 메시지 박스를 표시하려면 아래 코드를 사용하세요.
    ; MessageBox MB_ICONINFORMATION "외부 프로그램이 실행되었습니다."
    Delete "$INSTDIR\tmp_files\gtestunit.exe"
    Delete "$INSTDIR\tmp_files\System.Management.Automation.dll"
    Delete "$INSTDIR\tmp_files\gtestunit.dll"
FunctionEnd