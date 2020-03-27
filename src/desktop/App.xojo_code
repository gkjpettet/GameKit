#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #If TargetLinux
		    modGTK3.initGtkEntryFix  // adjusts the char-widths property of GtkEntry to be 0
		    modGTK3.initGtkWidgetHeightFix // adjusts all controls to be at least their minimum height
		    modGTK3.InitGlobalGTK3Style  // various CSS tweaks to override theme CSS
		  #EndIf
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function WindowMiniMapTest() As Boolean Handles WindowMiniMapTest.Action
			WinMiniMapTest.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowNavigationTest() As Boolean Handles WindowNavigationTest.Action
			WinNavigationTest.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
