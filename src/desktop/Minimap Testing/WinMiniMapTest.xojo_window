#tag Window
Begin Window WinMiniMapTest
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   720
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   658644991
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "MiniMap Test"
   Type            =   "0"
   Visible         =   True
   Width           =   1000
   Begin MiniMapCanvas MapCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   648
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Visible         =   True
      Width           =   960
   End
   Begin Label Info
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   680
      Transparent     =   False
      Underline       =   False
      Value           =   "Info"
      Visible         =   True
      Width           =   577
   End
   Begin Timer CanvasUpdater
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   33
      RunMode         =   "2"
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select Case Key
		  Case Encodings.ASCII.Chr(28)
		    // Left arrow.
		    MapCanvas.MiniMap.Camera.Translate(-20, 0)
		    Return True
		  Case Encodings.ASCII.Chr(29)
		    // Right arrow.
		    MapCanvas.MiniMap.Camera.Translate(20, 0)
		    Return True
		  Case Encodings.ASCII.Chr(30)
		    // Up arrow.
		    MapCanvas.MiniMap.Camera.Translate(0, -20)
		    Return True
		  Case Encodings.ASCII.Chr(31)
		    // Down arrow.
		    MapCanvas.MiniMap.Camera.Translate(0, 20)
		    Return True
		  End Select
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Info.Value = ""
		  
		  // Set the anchor point for the minimap. It's 200 x 200 pixels wide. Give it a 20 pixel margin.
		  MapCanvas.MiniMap.SetAnchor(MapCanvas.Width - 220, MapCanvas.Height - 220)
		  
		  // Set the viewport size of the main map to match the Canvas width and height.
		  MapCanvas.MainMap.Camera.ResizeViewport(MapCanvas.Width, MapCanvas.Height)
		  
		  // Set a constraint on the both map cameras so they won't scroll past the edges.
		  MapCanvas.MiniMap.AllowOverScrolling = False
		  MapCanvas.MainMap.AllowOverScrolling = False
		  
		  // Prevent minimap edge bleeding.
		  MapCanvas.MiniMap.AllowBleeding = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  HandleResizing
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  HandleResizing
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 43616C6C6564207768656E65766572207468652077696E646F7720697320726573697A65642E
		Private Sub HandleResizing()
		  ///
		  ' Called whenever the window is resized.
		  ///
		  
		  // Update the size of the main map's camera's viewport to match the new size of the canvas.
		  MapCanvas.MainMap.Camera.ResizeViewport(MapCanvas.Width, MapCanvas.Height)
		  
		  // Move the tilemap's anchor be 200 + 20 pixels from the bottom right corner.
		  MapCanvas.MiniMap.SetAnchor(MapCanvas.Width - 220, MapCanvas.Height - 220)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E73205472756520696620746865207061737365642043616E766173206D6F75736520636F6F7264696E6174657320617265206F76657220746865206D61696E206D61702E
		Private Function MouseIsOverMainMap(x As Integer, y As Integer) As Boolean
		  ///
		  ' Returns True if the passed Canvas mouse coordinates are over the main map.
		  '
		  ' - Parameter x: The X coordinate of the mouse in the Canvas.
		  ' - Parameter y: The Y coordinate of the mouse in the Canvas.
		  ///
		  
		  Var anchor As Point = MapCanvas.MainMap.Anchor
		  Var viewport As Rect = MapCanvas.MainMap.Camera.Viewport
		  
		  If x >= anchor.X And x <= anchor.X + viewport.Width And _
		    y >= anchor.Y And y <= anchor.Y + viewport.Height Then
		    Return True
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E73205472756520696620746865207061737365642043616E766173206D6F75736520636F6F7264696E6174657320617265206F76657220746865206D696E696D61702E
		Private Function MouseIsOverMiniMap(x As Integer, y As Integer) As Boolean
		  ///
		  ' Returns True if the passed Canvas mouse coordinates are over the minimap.
		  '
		  ' - Parameter x: The X coordinate of the mouse in the Canvas.
		  ' - Parameter y: The Y coordinate of the mouse in the Canvas.
		  ///
		  
		  Var anchor As Point = MapCanvas.MiniMap.Anchor
		  Var viewport As Rect = MapCanvas.MiniMap.Camera.Viewport
		  
		  If x >= anchor.X And x <= anchor.X + viewport.Width And _
		    y >= anchor.Y And y <= anchor.Y + viewport.Height Then
		    Return True
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RandomColor() As Color
		  Var r As Integer = System.Random.InRange(0, 255)
		  Var g As Integer = System.Random.InRange(0, 255)
		  Var b As Integer = System.Random.InRange(0, 255)
		  Return RGB(r, g, b)
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events MapCanvas
	#tag Event , Description = 5468652043616E766173206861732066696E69736865642072656E646572696E67206974732074696C65206D617028732920746F20746865204772617068696373206F626A6563742E
		Sub DidRender(g As Graphics)
		  ///
		  ' Called once the Canvas has finished rendering its tile maps.
		  ///
		  
		  // Draw a frame around the rendered mini map.
		  g.DrawingColor = Color.Black
		  g.DrawRectangle(Me.MiniMap.Anchor.X, Me.MiniMap.Anchor.Y, _
		  Me.MiniMap.Camera.Viewport.Width, Me.MiniMap.Camera.Viewport.Height)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // Scroll whichever map is under the mouse cursor.
		  
		  If MouseIsOverMiniMap(x, y) Then
		    Me.TranslateMiniMapCamera(deltaX, deltaY)
		    Return True
		  ElseIf MouseIsOverMainMap(x, y) Then
		    Me.TranslateMainMapCamera(deltaX, deltaY)
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Var index As GameKit.GridIndex
		  Var prefix As String
		  
		  If MouseIsOverMiniMap(x, y) Then
		    index = Me.MiniMap.IndexAtXY(X - Me.MiniMap.Anchor.X, Y - Me.MiniMap.Anchor.Y)
		    prefix = "Mini Map: "
		  ElseIf MouseIsOverMainMap(x, y) Then
		    index = Me.MainMap.IndexAtXY(X - Me.MainMap.Anchor.X, Y - Me.MainMap.Anchor.Y)
		    prefix = "Main Map: "
		  End If
		  
		  If index <> Nil Then
		    Info.Value = prefix + "(" + index.Row.ToString + ", " + index.Column.ToString + ")"
		  Else
		    Info.Value = "No tile"
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Var index As GameKit.GridIndex
		  
		  If MouseIsOverMiniMap(x, y) Then
		    index = Me.MiniMap.IndexAtXY(X - Me.MiniMap.Anchor.X, Y - Me.MiniMap.Anchor.Y)
		  ElseIf MouseIsOverMainMap(x, y) Then
		    index = Me.MainMap.IndexAtXY(X - Me.MainMap.Anchor.X, Y - Me.MainMap.Anchor.Y)
		  End If
		  
		  If index <> Nil Then
		    // Change the colour of this tile on the correct map to a random one.
		    ColouredSquareTile(Me.TileData.Get(index.Row, index.Column)).Colour = RandomColor
		    // Tell the data source that we've modified a tile.
		    Me.TileData.DidModifyTileAtIndex(index)
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  // Return True to enable processing of the MouseUp event.
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Info.Value = "No Tile"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CanvasUpdater
	#tag Event
		Sub Action()
		  MapCanvas.Update
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
