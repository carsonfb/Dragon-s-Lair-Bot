; Dragon's Lair Bot v1.1
; 2019-01-16, Carson F. Ball
; Last updated: 2022-08-29, Carson F. Ball
;
; License
; -------
; **Creative commons Attribution-NonCommercial (CC BY-NC)**
;
; You can share this code (including your own modifications) as long as the following conditions are
; met.  Please see the links below for more information.
;
; 1. You state somewehere in the program credits (and documentation if applicable) that Carson F. Ball
; is the original author and list the location that the original can be downloaded (LINK HERE).
;
; 2. You do not claim that Carson F. Ball endorses or approved of any modifications that you make and
; you clearly indicate that you have made modifications.
;
; 3. You do not release this code commercially.
;
; Plain text of the license: https://creativecommons.org/licenses/by-nc/4.0/
;
; Full legalese of the license: https://creativecommons.org/licenses/by-nc/4.0/legalcode

; -------------------------------------------------
; Setup hot keys
; -------------------------------------------------
; Setup the hotkey to start the script.
HotKeySet( "{F3}", Start )

; Setup the hotkey to stop the script.
HotKeySet( "{F4}", Terminate )

; Setup the hotkey to pause the script.
HotKeySet( "{F5}", Pause )

; -------------------------------------------------
; Setup the GUI elements and display the interface.
; -------------------------------------------------
Local $hGUI = GUICreate ( "Dragon's Lair Bot", 640, 480 )

$hUpColor_1 = GUICtrlCreateLabel( "Up Color", 30, 20, 100, 20 )
$hUpColor_2 = GUICtrlCreateLabel( "--------", 90, 20, 100, 20 )
$hUpColor_3 = GUICtrlCreateLabel( "--------", 150, 20, 100, 20 )
$hUpColor_4 = GUICtrlCreateLabel( "--------", 210, 20, 100, 20 )

$hDownColor_1 = GUICtrlCreateLabel( "Down Color", 30, 40, 100, 20 )
$hDownColor_2 = GUICtrlCreateLabel( "--------", 90, 40, 100, 20 )
$hDownColor_3 = GUICtrlCreateLabel( "--------", 150, 40, 100, 20 )
$hDownColor_4 = GUICtrlCreateLabel( "--------", 210, 40, 100, 20 )

$hLeftColor_1 = GUICtrlCreateLabel( "Left Color", 30, 60, 100, 20 )
$hLeftColor_2 = GUICtrlCreateLabel( "--------", 90, 60, 100, 20 )
$hLeftColor_3 = GUICtrlCreateLabel( "--------", 150, 60, 100, 20 )
$hLeftColor_4 = GUICtrlCreateLabel( "--------", 210, 60, 100, 20 )

$hRightColor_1 = GUICtrlCreateLabel( "Right Color", 30, 80, 100, 20 )
$hRightColor_2 = GUICtrlCreateLabel( "--------", 90, 80, 100, 20 )
$hRightColor_3 = GUICtrlCreateLabel( "--------", 150, 80, 100, 20 )
$hRightColor_4 = GUICtrlCreateLabel( "--------", 210, 80, 100, 20 )

$hSwordColor_1 = GUICtrlCreateLabel( "Sword Color", 30, 100, 100, 20 )
$hSwordColor_2 = GUICtrlCreateLabel( "--------", 90, 100, 100, 20 )
$hSwordColor_3 = GUICtrlCreateLabel( "--------", 150, 100, 100, 20 )
$hSwordColor_4 = GUICtrlCreateLabel( "--------", 210, 100, 100, 20 )
$hSwordColor_5 = GUICtrlCreateLabel( "--------", 270, 100, 100, 20 )

$bPause = 0

GUISetState( @SW_SHOW, $hGUI )

; Keep the script running.
While 1
WEnd

; The main function of the script.
Func Start()
    ; Main loop of the script.
    While 1
        ; Check for the up arrow and click the button if it is lit.
        If CheckUp() Then MouseClick( "primary", 959, 775, 1, 0)

        ; Check for the down arrow and click the button if it is lit.
        If CheckDown() Then MouseClick( "primary", 959, 1002, 1, 0)

        ; Check for the left arrow and click the button if it is lit.
        If CheckLeft() Then MouseClick( "primary", 845, 889, 1, 0)

        ; Check for the right arrow and click the button if it is lit.
        If CheckRight() Then MouseClick( "primary", 1073, 889, 1, 0)

        ; Check for the sword and click the button if it is lit.
        If CheckSword() Then MouseClick( "primary", 959, 889, 1, 0)

        ; wait for 1/16 second.
        ;  Polling 1/8 of a second (125) is often enough to win the game,
        ; but occasionally doesn't notice that the button is lit.
        Sleep( 62 )
    WEnd
EndFunc

; The function to check the up indicator.
Func CheckUp()
    If Not $bPause Then
        GUICtrlSetData( $hUpColor_2, Hex( PixelGetColor( 959, 729 ) ) )
        GUICtrlSetData( $hUpColor_3, Hex( PixelGetColor( 909, 825 ) ) )
        GUICtrlSetData( $hUpColor_4, Hex( PixelGetColor( 1007, 825 ) ) )
    EndIf

    If CheckColor( PixelGetColor( 959, 729 ) ) _
        AND CheckColor( PixelGetColor( 909, 825 ) ) _
        AND CheckColor( PixelGetColor( 1007, 824 ) ) Then
        Return 1
    EndIf

    Return 0
EndFunc

; The function to check the down indicator.
Func CheckDown()
    If Not $bPause Then
        GUICtrlSetData( $hDownColor_2, Hex( PixelGetColor( 959, 1051 ) ) )
        GUICtrlSetData( $hDownColor_3, Hex( PixelGetColor( 908, 954 ) ) )
        GUICtrlSetData( $hDownColor_4, Hex( PixelGetColor( 1008, 954 ) ) )
    EndIf

    If CheckColor( PixelGetColor( 959, 1051 ) ) _
        AND CheckColor( PixelGetColor(  908, 954 ) ) _
        AND CheckColor( PixelGetColor( 1008, 954 ) ) Then
        Return 1
    EndIf

    Return 0
EndFunc

; The function to check the left indicator.
Func CheckLeft()
    If Not $bPause Then
        GUICtrlSetData( $hLeftColor_2, Hex( PixelGetColor( 800, 891 ) ) )
        GUICtrlSetData( $hLeftColor_3, Hex( PixelGetColor( 889, 844 ) ) )
        GUICtrlSetData( $hLeftColor_4, Hex( PixelGetColor( 889, 936 ) ) )
    EndIf

    If CheckColor( PixelGetColor( 800, 891 ) ) _
        AND CheckColor( PixelGetColor( 889, 844 ) ) _
        AND CheckColor( PixelGetColor( 889, 936 ) ) Then
        Return 1
    EndIf

    Return 0
EndFunc

; The function to check the right indicator.
Func CheckRight()
    If Not $bPause Then
        GUICtrlSetData( $hRightColor_2, Hex( PixelGetColor( 1123, 889 ) ) )
        GUICtrlSetData( $hRightColor_3, Hex( PixelGetColor( 1023, 839 ) ) )
        GUICtrlSetData( $hRightColor_4, Hex( PixelGetColor( 1023, 939 ) ) )
    EndIf

    If CheckColor( PixelGetColor( 1123, 889) ) _
        AND CheckColor( PixelGetColor( 1023, 839 ) ) _
        AND CheckColor( PixelGetColor( 1023, 939 ) ) Then
        Return 1
    EndIf

    Return 0
EndFunc

; The function to check the sword indicator.
Func CheckSword()
    If Not $bPause Then
        GUICtrlSetData( $hSwordColor_2, Hex( PixelGetColor( 959, 835 ) ) )
        GUICtrlSetData( $hSwordColor_3, Hex( PixelGetColor( 959, 943 ) ) )
        GUICtrlSetData( $hSwordColor_4, Hex( PixelGetColor( 905, 893  ) ) )
        GUICtrlSetData( $hSwordColor_5, Hex( PixelGetColor( 1013, 893 ) ) )
    EndIf

    If CheckColor( PixelGetColor( 959, 835) ) _
        AND CheckColor( PixelGetColor( 959, 943 ) ) _
        AND CheckColor( PixelGetColor( 905, 893 ) ) _
        AND CheckColor( PixelGetColor( 1013, 893 ) ) Then
        Return 1
    EndIf

    Return 0
EndFunc

; The function to verify the color of the indicator.
Func CheckColor( ByRef $iColor )
    Local $iRed   = BitShift( BitAND( $iColor, 0xFF0000 ), 16 )
    Local $iGreen = BitShift( BitAND( $iColor, 0x00FF00 ),  8 )
    Local $iBlue  = BitAND( $iColor, 0x0000FF )

    if $iRed >= 0xF0 And $iGreen >= 0xD0 And $iBlue <= 0x10 Then
        Return 1
    EndIf

    Return 0
EndFunc

Func Pause()
    $bPause = BitXOR( $bPause, 1 )
EndFunc

; The function to terminate the script.
Func Terminate()
    Exit
EndFunc