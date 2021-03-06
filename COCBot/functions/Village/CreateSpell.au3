Func CreateSpell()
	If $SpellDarkStorage = 0 Then Return

  	SetLog("Create Lightning Spells...", $COLOR_BLUE)

	If $SFactoryPos[0] = "" Then
		 LocateSFactory()
		 SaveConfig()
		 If _Sleep(1000) Then Return
	EndIf

	ClickP($TopLeftClient) ;Click Away
	If _Sleep(500) Then Return

	Click($SFactoryPos[0], $SFactoryPos[1]) ;Click Spell Factory
	If _Sleep(500) Then Return

	Local $CreatePos = _PixelSearch(249, 563, 610, 639, Hex(0x001048, 6), 5) ;Finds Create Spells button
	If IsArray($CreatePos) = False Then
		SetLog("Spell Factory is not available", $COLOR_RED)
		If _Sleep(500) Then Return
	Else
		Click($CreatePos[0], $CreatePos[1]) ;Click Create Spell
		If _Sleep(500) Then Return

			_CaptureRegion()
			While _ColorCheck(_GetPixelColor(250, 357), Hex(0xCC4FC6, 6), 20)
				Click(220, 320, 5) ;Lightning Spell
				If _Sleep(200) Then ExitLoop
			    _CaptureRegion()
			WEnd
	EndIf

    If _Sleep(500) Then Return
	Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
    SetLog("Create Spell Complete...", $COLOR_BLUE)

EndFunc   ;==>Create Spell