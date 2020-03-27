#tag Class
Protected Class MiniMapCanvas
Inherits Canvas
Implements GameKit.IObserver
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  // Draw a grey background.
		  g.DrawingColor = Color.LightGray
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  // Fire the WillRender event before we render.
		  WillRender(g)
		  
		  // Render the main map first.
		  Self.MainMap.Render(g)
		  
		  // Then render the mini map.
		  Self.MiniMap.Render(g)
		  
		  // Fire the DidRender event now we're done rendering.
		  DidRender(g)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  // Create a 100 x 100 tile map.
		  CreateTiles(100, 100)
		  
		  // Initialise the minimap.
		  Self.MiniMap = New GameKit.SquareMap(TileData, 12, 12, 0, 0)
		  // Set the camera's viewport for the minimap to a 200 x 200 square.
		  Self.MiniMap.SetCamera(New GameKit.Camera(New Rect(0, 0, 200, 200)))
		  
		  // Initialise the main map. Anchor it to (0, 0).
		  Self.MainMap = New GameKit.SquareMap(TileData, 64, 64, 0, 0)
		  
		  // Due to a limitation with Xojo, at this point in the Canvas' lifetime, it doesn't 
		  // have a width or a height. We'll therefore create a viewport with a size of 1 x 1 (the minimum) 
		  // and adjust the viewport size of the camera to match the size of the Canvas in its 
		  // enclosing window later.
		  Self.MainMap.SetCamera(New GameKit.Camera(New Rect(0, 0, 1, 1)))
		  
		  // Register this Canvas as an observer to the notifications posted by both 
		  // the main map and the minimap.
		  Self.MiniMap.AddObserver(Self)
		  Self.MainMap.AddObserver(Self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateTiles(numRows As Integer, numColumns As Integer)
		  ///
		  ' Creates a test map of tiles.
		  ' Red on the periphery with a green inner border and a central yellow tile.
		  ///
		  
		  Self.TileData = New GameKit.MapDataSource(numRows, numColumns)
		  
		  // Add the tiles to the data source.
		  For col As Integer = 0 to numColumns - 1
		    For row As Integer = 0 To numRows - 1
		      Var colour As Color
		      If col = 0 Or col = numColumns - 1 Or row = 0 Or row = numRows - 1 Then
		        colour = Color.Red
		      ElseIf col = 2 Or col = numColumns - 3 Or row = 2 Or row = numRows - 3 Then
		        colour = Color.Green
		      ElseIf col = Floor(numColumns/2) And row = Floor(numRows/2) Then
		        colour = Color.Yellow
		      Else
		        colour = Color.White
		      End If
		      
		      Self.TileData.Set(New ColouredSquareTile(colour), row, col)
		    Next row
		  Next col
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 412047616D654B6974206E6F74696669636174696F6E20686173206265656E2072656365697665642E
		Sub NotificationReceived(notification As GameKit.Notification)
		  /// 
		  ' A GameKit notification has been received.
		  '
		  ' - Parameter notification: The notification.
		  '
		  ' - Note: Part of the GameKit.IObserver interface.
		  ///
		  
		  Select Case notification.EventType
		  Case GameKit.Events.TileMapAppearanceDidChange, _
		    GameKit.Events.CameraDidMove
		    mNeedsUpdating = True
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520706F736974696F6E206F662074686973206D6170277320616E63686F7220746F207468652073706563696669656420636F6F7264696E617465732E
		Sub SetAnchor(x As Double, y As Double)
		  ///
		  ' Sets the position of this map's anchor to the specified coordinates.
		  '
		  ' - Parameter x: The new X position of the map's anchor.
		  ' - Parameter y: The new Y position of the map's anchor.
		  '
		  ' - Note: (0, 0) is the top-left corner.
		  ///
		  
		  Self.MiniMap.SetAnchor(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206D61696E206D617027732063616D65726120696E20746865205820646972656374696F6E2E20506F736974697665206D6F7665732069742072696768742C206E65676174697665206C6566742E
		Sub TranslateMainMapCamera(x As Double, y As Double)
		  ///
		  ' Translates the main map's camera in the (X,Y) direction.
		  '
		  ' - Parameter x: The number of pixels to move the camera in the X direction. Positive moves it right.
		  ' - Parameter y: The number of pixels to move the camera in the Y direction. Positive moves it down.
		  ///
		  
		  If Self.MainMap.Camera <> Nil Then Self.MainMap.Camera.Translate(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206D696E69206D617027732063616D65726120696E20746865205820646972656374696F6E2E20506F736974697665206D6F7665732069742072696768742C206E65676174697665206C6566742E
		Sub TranslateMiniMapCamera(x As Double, y As Double)
		  ///
		  ' Translates the minimap's camera in the (X,Y) direction.
		  '
		  ' - Parameter x: The number of pixels to move the camera in the X direction. Positive moves it right.
		  ' - Parameter y: The number of pixels to move the camera in the Y direction. Positive moves it down.
		  ///
		  
		  If Self.MiniMap.Camera <> Nil Then Self.MiniMap.Camera.Translate(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44657465726D696E657320696620616E797468696E67206F6E207468652063616E76617320686173206368616E6765642073696E636520746865206C61737420605061696E7460206576656E742E20496620736F2C2069742063616C6C7320605061696E746020616761696E2E
		Sub Update(force As Boolean = False)
		  ///
		  ' Determines if anything on the canvas has changed since the last `Paint` event.
		  ' If so, it calls `Paint` again.
		  '
		  ' - Parameter force: If True then the canvas will be forcibly repainted.
		  ///
		  
		  If mNeedsUpdating Or force Then
		    Invalidate
		    mNeedsUpdating = False
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 5468652043616E766173206861732066696E69736865642072656E646572696E67206974732074696C65206D617028732920746F20746865204772617068696373206F626A6563742E
		Event DidRender(g As Graphics)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 5468652074696C65206D61702069732061626F757420746F2072656E64657220697473656C6620746F20746865204772617068696373206F626A6563742E
		Event WillRender(g As Graphics)
	#tag EndHook


	#tag Property, Flags = &h0
		MainMap As GameKit.SquareMap
	#tag EndProperty

	#tag Property, Flags = &h0
		MiniMap As GameKit.SquareMap
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 49662054727565207468656E207468652063616E7661732072657175697265732072657061696E74696E6720617420746865206E6578742060557064617465602063616C6C2E
		Private mNeedsUpdating As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		TileData As GameKit.MapDataSource
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
