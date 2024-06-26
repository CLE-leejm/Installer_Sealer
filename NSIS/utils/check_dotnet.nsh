!include "LogicLib.nsh"

Function CheckNetFramework47
    ClearErrors
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Release"
    IfErrors not_found

    ${If} $0 >= 460798
        DetailPrint ".NET Framework 4.7 or higher is installed."

        # 상세 버전 정보를 출력합니다.
        ${Switch} $0
            ${Case} 460798
                DetailPrint "Installed version: 4.7"
                ${Break}
            ${Case} 461308
                DetailPrint "Installed version: 4.7.1"
                ${Break}
            ${Case} 461808
                DetailPrint "Installed version: 4.7.2"
                ${Break}
            ${Case} 528040
                DetailPrint "Installed version: 4.8"
                ${Break}
            ${Case} 533320
                DetailPrint "Installed version: 4.8.1"
                ${Break}
            ${Default}
                DetailPrint "Installed version: Higher than 4.8"
                ${Break}
        ${EndSwitch}

    ${Else}
        DetailPrint ".NET Framework 4.7 is not installed."
        DetailPrint "Attempting to install .NET Framework 4.7.2..."
        ExecWait '""$INSTDIR\tmp_files\ndp472-kb4054530-x86-x64-allos-enu.exe"'
    ${EndIf}
    Return

not_found:
    DetailPrint "Error: Unable to check .NET Framework version."
FunctionEnd