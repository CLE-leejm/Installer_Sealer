; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "CleSealer"
!define PRODUCT_VERSION "1.0.0.0"
!define PRODUCT_PUBLISHER "CLE, Inc."
!define PRODUCT_WEB_SITE "https://cle.vision/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\SealerInspectionVisionSystemForm.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "LogicLib.nsh"
!include "utils\cle_functions.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "sealer_main_logo.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "License.rtf"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\SealerInspectionVisionSystemForm.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "SealerSetupV1.0.0.0.exe"
InstallDir "C:\CLE\Sealer"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show




# section 모듈화
!include "sections\cle_sections.nsh"



Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  SetRegView 64
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\SealerInspectionVisionSystemForm.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\SealerInspectionVisionSystemForm.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)는(은) 완전히 제거되었습니다."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)을(를) 제거하시겠습니까?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\ProducerGEV.cti"
  Delete "$INSTDIR\OMM\YamlDotNet.dll"
  Delete "$INSTDIR\OMM\TaskSchedulerManager.dll"
  Delete "$INSTDIR\OMM\System.Runtime.CompilerServices.Unsafe.dll"
  Delete "$INSTDIR\OMM\System.Data.SQLite.dll"
  Delete "$INSTDIR\OMM\Sharp7.dll"
  Delete "$INSTDIR\OMM\Settings\세훈\config.yml"
  Delete "$INSTDIR\OMM\SealerOfflineMasterManager.exe"
  Delete "$INSTDIR\OMM\SealerInspectionVisionSystemForm.exe"
  Delete "$INSTDIR\OMM\SealerInspectionVisionSystem.View.dll"
  Delete "$INSTDIR\OMM\SealerInspectionVisionSystem.Presenters.dll"
  Delete "$INSTDIR\OMM\SealerInspectionVisionSystem.Models.dll"
  Delete "$INSTDIR\OMM\Resources\visionOKOn.png"
  Delete "$INSTDIR\OMM\Resources\visionOKOff.png"
  Delete "$INSTDIR\OMM\Resources\visionNGOn.png"
  Delete "$INSTDIR\OMM\Resources\visionNGOff.png"
  Delete "$INSTDIR\OMM\Resources\NanumSquareRoundB.ttf"
  Delete "$INSTDIR\OMM\pword"
  Delete "$INSTDIR\OMM\OpenGL.Net.WinForms.dll"
  Delete "$INSTDIR\OMM\OpenGL.Net.dll"
  Delete "$INSTDIR\OMM\offlineConfig.yml"
  Delete "$INSTDIR\OMM\MaterialSkin.dll"
  Delete "$INSTDIR\OMM\log\LOG\2023-12-27.log"
  Delete "$INSTDIR\OMM\libplctag.NativeImport.dll"
  Delete "$INSTDIR\OMM\libplctag.dll"
  Delete "$INSTDIR\OMM\Lang\toggle.resx"
  Delete "$INSTDIR\OMM\Lang\toggle.Designer.cs"
  Delete "$INSTDIR\OMM\Lang\Sealer.resx"
  Delete "$INSTDIR\OMM\Lang\MsgBoxSealer.resx"
  Delete "$INSTDIR\OMM\Lang\MsgBoxSealer.Designer.cs"
  Delete "$INSTDIR\OMM\Lang\AddLineLaser.resx"
  Delete "$INSTDIR\OMM\Lang\AddLineLaser.Designer.cs"
  Delete "$INSTDIR\OMM\Lang\AddCarT.resx"
  Delete "$INSTDIR\OMM\Lang\AddCarT.Designer.cs"
  Delete "$INSTDIR\OMM\Lang\AddCamera2D.resx"
  Delete "$INSTDIR\OMM\Lang\AddCamera2D.Designer.cs"
  Delete "$INSTDIR\OMM\ko-KR\SealerOfflineMasterManager.resources.dll"
  Delete "$INSTDIR\OMM\ko-KR\SealerInspectionVisionSystemForm.resources.dll"
  Delete "$INSTDIR\OMM\ko-KR\SealerInspectionVisionSystem.Presenters.resources.dll"
  Delete "$INSTDIR\OMM\ko-KR\SealerInspectionVisionSystem.Models.resources.dll"
  Delete "$INSTDIR\OMM\InspectionEngine.dll"
  Delete "$INSTDIR\OMM\en-US\SealerOfflineMasterManager.resources.dll"
  Delete "$INSTDIR\OMM\en-US\SealerInspectionVisionSystemForm.resources.dll"
  Delete "$INSTDIR\OMM\en-US\SealerInspectionVisionSystem.Presenters.resources.dll"
  Delete "$INSTDIR\OMM\en-US\SealerInspectionVisionSystem.Models.resources.dll"
  Delete "$INSTDIR\OMM\DocumentFormat.OpenXml.dll"
  Delete "$INSTDIR\OMM\Dapper.dll"
  Delete "$INSTDIR\OMM\CoPick.Plc.dll"
  Delete "$INSTDIR\OMM\CoPick.dll"
  Delete "$INSTDIR\OMM\CoPick.Controls.dll"
  Delete "$INSTDIR\OMM\CoPick.Apps.dll"
  Delete "$INSTDIR\OMM\config.yml"
  Delete "$INSTDIR\MAIN\YamlDotNet.dll"
  Delete "$INSTDIR\MAIN\x86\sqlite3.dll"
  Delete "$INSTDIR\MAIN\x86\SQLite.Interop.dll"
  Delete "$INSTDIR\MAIN\x64\sqlite3.dll"
  Delete "$INSTDIR\MAIN\x64\SQLite.Interop.dll"
  Delete "$INSTDIR\MAIN\TaskSchedulerManager.dll"
  Delete "$INSTDIR\MAIN\System.Runtime.CompilerServices.Unsafe.dll"
  Delete "$INSTDIR\MAIN\System.Numerics.Vectors.dll"
  Delete "$INSTDIR\MAIN\System.Memory.dll"
  Delete "$INSTDIR\MAIN\System.Data.SQLite.Linq.dll"
  Delete "$INSTDIR\MAIN\System.Data.SQLite.EF6.dll"
  Delete "$INSTDIR\MAIN\System.Data.SQLite.dll"
  Delete "$INSTDIR\MAIN\System.Buffers.dll"
  Delete "$INSTDIR\MAIN\SQLitePCLRaw.provider.dynamic_cdecl.dll"
  Delete "$INSTDIR\MAIN\SQLitePCLRaw.core.dll"
  Delete "$INSTDIR\MAIN\SQLitePCLRaw.batteries_v2.dll"
  Delete "$INSTDIR\MAIN\Sharp7.dll"
  Delete "$INSTDIR\MAIN\SealerInspectionVisionSystemForm.exe"
  Delete "$INSTDIR\MAIN\SealerInspectionVisionSystem.View.dll"
  Delete "$INSTDIR\MAIN\SealerInspectionVisionSystem.Presenters.dll"
  Delete "$INSTDIR\MAIN\SealerInspectionVisionSystem.Models.dll"
  Delete "$INSTDIR\MAIN\Resources\visionOKOn.png"
  Delete "$INSTDIR\MAIN\Resources\visionOKOff.png"
  Delete "$INSTDIR\MAIN\Resources\visionNGOn.png"
  Delete "$INSTDIR\MAIN\Resources\visionNGOff.png"
  Delete "$INSTDIR\MAIN\Resources\NanumSquareRoundB.ttf"
  Delete "$INSTDIR\MAIN\pword"
  Delete "$INSTDIR\MAIN\ProductionRecordManager.exe"
  Delete "$INSTDIR\MAIN\ProductionRecord.db"
  Delete "$INSTDIR\MAIN\OpenGL.Net.WinForms.dll"
  Delete "$INSTDIR\MAIN\OpenGL.Net.Math.dll"
  Delete "$INSTDIR\MAIN\OpenGL.Net.dll"
  Delete "$INSTDIR\MAIN\Microsoft.Data.Sqlite.dll"
  Delete "$INSTDIR\MAIN\MaterialSkin.dll"
  Delete "$INSTDIR\MAIN\log\LOG\2023-12-27.log"
  Delete "$INSTDIR\MAIN\libplctag.NativeImport.dll"
  Delete "$INSTDIR\MAIN\libplctag.dll"
  Delete "$INSTDIR\MAIN\Lang\toggle.resx"
  Delete "$INSTDIR\MAIN\Lang\toggle.Designer.cs"
  Delete "$INSTDIR\MAIN\Lang\Sealer.resx"
  Delete "$INSTDIR\MAIN\Lang\MsgBoxSealer.resx"
  Delete "$INSTDIR\MAIN\Lang\MsgBoxSealer.Designer.cs"
  Delete "$INSTDIR\MAIN\Lang\AddLineLaser.resx"
  Delete "$INSTDIR\MAIN\Lang\AddLineLaser.Designer.cs"
  Delete "$INSTDIR\MAIN\Lang\AddCarT.resx"
  Delete "$INSTDIR\MAIN\Lang\AddCarT.Designer.cs"
  Delete "$INSTDIR\MAIN\Lang\AddCamera2D.resx"
  Delete "$INSTDIR\MAIN\Lang\AddCamera2D.Designer.cs"
  Delete "$INSTDIR\MAIN\ko-KR\SealerInspectionVisionSystemForm.resources.dll"
  Delete "$INSTDIR\MAIN\ko-KR\SealerInspectionVisionSystem.Presenters.resources.dll"
  Delete "$INSTDIR\MAIN\ko-KR\SealerInspectionVisionSystem.Models.resources.dll"
  Delete "$INSTDIR\MAIN\ko-KR\ProductionRecordManager.resources.dll"
  Delete "$INSTDIR\MAIN\InspectionEngine.dll"
  Delete "$INSTDIR\MAIN\EntityFramework.SqlServer.dll"
  Delete "$INSTDIR\MAIN\EntityFramework.dll"
  Delete "$INSTDIR\MAIN\en-US\SealerInspectionVisionSystemForm.resources.dll"
  Delete "$INSTDIR\MAIN\en-US\SealerInspectionVisionSystem.Presenters.resources.dll"
  Delete "$INSTDIR\MAIN\en-US\SealerInspectionVisionSystem.Models.resources.dll"
  Delete "$INSTDIR\MAIN\en-US\ProductionRecordManager.resources.dll"
  Delete "$INSTDIR\MAIN\DocumentFormat.OpenXml.dll"
  Delete "$INSTDIR\MAIN\Dapper.dll"
  Delete "$INSTDIR\MAIN\CoPick.Plc.dll"
  Delete "$INSTDIR\MAIN\CoPick.dll"
  Delete "$INSTDIR\MAIN\CoPick.Controls.dll"
  Delete "$INSTDIR\MAIN\CoPick.Apps.dll"
  Delete "$INSTDIR\MAIN\config.yml"
  Delete "$INSTDIR\MAIN\Basler.Pylon.dll"
  Delete "$INSTDIR\MAIN\AvailableCarType.bin"
  Delete "$INSTDIR\LIBS\zlibwapi.dll"
  Delete "$INSTDIR\LIBS\XmlParser_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\uv.dll"
  Delete "$INSTDIR\LIBS\swscale-7.dll"
  Delete "$INSTDIR\LIBS\swresample-4.dll"
  Delete "$INSTDIR\LIBS\SR_API-x64.dll"
  Delete "$INSTDIR\LIBS\PylonUtility_v7_3.dll"
  Delete "$INSTDIR\LIBS\PylonGUI_v7_3.dll"
  Delete "$INSTDIR\LIBS\PylonGtc_v7_3_TL.dll"
  Delete "$INSTDIR\LIBS\PylonGigE_v7_3_TL.dll"
  Delete "$INSTDIR\LIBS\PylonCamEmu_v7_3_TL.dll"
  Delete "$INSTDIR\LIBS\PylonBase_v7_3.dll"
  Delete "$INSTDIR\LIBS\postproc-57.dll"
  Delete "$INSTDIR\LIBS\PocoFoundation64.dll"
  Delete "$INSTDIR\LIBS\nvToolsExt64_1.dll"
  Delete "$INSTDIR\LIBS\nvfuser_codegen.dll"
  Delete "$INSTDIR\LIBS\NodeMapData_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\MathParser_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\Log_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\log4cpp_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\libiomp5md.dll"
  Delete "$INSTDIR\LIBS\gxapi_v14.dll"
  Delete "$INSTDIR\LIBS\gthread-2-vs10.dll"
  Delete "$INSTDIR\LIBS\gobject-2-vs10.dll"
  Delete "$INSTDIR\LIBS\gmodule-2-vs10.dll"
  Delete "$INSTDIR\LIBS\glib-2-vs10.dll"
  Delete "$INSTDIR\LIBS\gio-2-vs10.dll"
  Delete "$INSTDIR\LIBS\GenApi_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\GCBase_MD_VC141_v3_1_Basler_pylon.dll"
  Delete "$INSTDIR\LIBS\fbgemm.dll"
  Delete "$INSTDIR\LIBS\cudnn64_8.dll"
  Delete "$INSTDIR\LIBS\CLE-Basler-CCTV-dll.dll"
  Delete "$INSTDIR\LIBS\c10_cuda.dll"
  Delete "$INSTDIR\LIBS\c10.dll"
  Delete "$INSTDIR\LIBS\boost_program_options-vc141-mt-1_65.dll"
  Delete "$INSTDIR\LIBS\Basler.Pylon.dll"
  Delete "$INSTDIR\LIBS\avutil-58.dll"
  Delete "$INSTDIR\LIBS\avformat-60.dll"
  Delete "$INSTDIR\LIBS\avfilter-9.dll"
  Delete "$INSTDIR\LIBS\avdevice-60.dll"
  Delete "$INSTDIR\LIBS\asmjit.dll"
  Delete "$INSTDIR\ECCO85_Liveimage.par"

  ; 바로가기 제거
  Delete "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\Uninstall.lnk"
  Delete "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\Website.lnk"
  
  Delete "$DESKTOP\SealerInspectionVisionSystemForm.0.0.0.lnk"
  Delete "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\SealerInspectionVisionSystemForm.0.0.0.lnk"

  Delete "$DESKTOP\ProductionRecordManagerV1.0.0.0.lnk"
  Delete "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\ProductionRecordManagerV1.0.0.0.lnk"

  Delete "$DESKTOP\SealerOfflineMasterManagerV1.0.0.0.lnk"
  Delete "$SMPROGRAMS\CleSealerInstallerV1.0.0.0\SealerOfflineMasterManagerV1.0.0.0.lnk"

  

  RMDir "$SMPROGRAMS\응용 프로그램"
  RMDir "$INSTDIR\OMM\Settings\세훈"
  RMDir "$INSTDIR\OMM\Resources"
  RMDir "$INSTDIR\OMM\log\LOG"
  RMDir "$INSTDIR\OMM\Lang"
  RMDir "$INSTDIR\OMM\ko-KR"
  RMDir "$INSTDIR\OMM\en-US"
  RMDir "$INSTDIR\OMM"
  RMDir "$INSTDIR\MAIN\x86"
  RMDir "$INSTDIR\MAIN\x64"
  RMDir "$INSTDIR\MAIN\Resources"
  RMDir "$INSTDIR\MAIN\log\LOG"
  RMDir "$INSTDIR\MAIN\Lang"
  RMDir "$INSTDIR\MAIN\ko-KR"
  RMDir "$INSTDIR\MAIN\en-US"
  RMDir "$INSTDIR\MAIN"
  RMDir "$INSTDIR\LIBS"
  RMDir "$INSTDIR"
  ; 남아 있더라도 지우기
  RMDir /r "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"

  # 설치된 다른 Cle Program 확인후 없으면 C:\CLE 폴더 및  공용 PATH 삭제
  Call un.remove_sys_path
  ; Call un.CheckCleProgram
  SetAutoClose true
SectionEnd