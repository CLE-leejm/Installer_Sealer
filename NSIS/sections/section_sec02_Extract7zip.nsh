Section "extract_7zip" SEC02

    Nsis7z::Extract "$EXEDIR\7zip.7z" "$INSTDIR\LIBS\"

    ; CopyFiles "$EXEDIR\commonlibs.7z" "$INSTDIR\"
    ; Nsis7z::Extract "$EXEDIR\commonlibs.7z" "$INSTDIR"
    ; Delete "$INSTDIR\commonlibs.7z"
SectionEnd