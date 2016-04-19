${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
		; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0
		StrCpy $Bits 32
	${Else}
		StrCpy $Bits 64
	${EndIf}
!macroend

${SegmentInit}
	${If} $Bits == 64
		Rename "$EXEDIR\App\MacroCreator\MacroCreator.exe" "$EXEDIR\App\MacroCreator\MacroCreator32.exe"
		Rename "$EXEDIR\App\MacroCreator\MacroCreator64.exe" "$EXEDIR\App\MacroCreator\MacroCreator.exe"
		Rename "$EXEDIR\App\MacroCreator\SciLexer.dll" "$EXEDIR\App\MacroCreator\SciLexer32.dll"
		Rename "$EXEDIR\App\MacroCreator\SciLexer64.dll" "$EXEDIR\App\MacroCreator\SciLexer.dll"
	${EndIf}
!macroend

${SegmentPost}
	${If} $Bits == 64
		Rename "$EXEDIR\App\MacroCreator\MacroCreator.exe" "$EXEDIR\App\MacroCreator\MacroCreator64.exe"
		Rename "$EXEDIR\App\MacroCreator\MacroCreator32.exe" "$EXEDIR\App\MacroCreator\MacroCreator.exe"
		Rename "$EXEDIR\App\MacroCreator\SciLexer.dll" "$EXEDIR\App\MacroCreator\SciLexer64.dll"
		Rename "$EXEDIR\App\MacroCreator\SciLexer32.dll" "$EXEDIR\App\MacroCreator\SciLexer.dll"
	${EndIf}	
!macroend