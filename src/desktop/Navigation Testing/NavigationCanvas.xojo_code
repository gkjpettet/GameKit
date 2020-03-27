#tag Class
Protected Class NavigationCanvas
Inherits Canvas
Implements GameKit.IObserver
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  // Draw a grey background.
		  g.DrawingColor = Color.LightGray
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  // Render the map.
		  Self.Map.Render(g)
		  
		  // Fire the DidRender event now we're done rendering.
		  DidRender(g)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  // Create a 50 x 50 tile map.
		  CreateTiles(50, 50)
		  
		  // Initialise the map with 32 x 32 tiles. Anchor it to (0, 0).
		  mTileWidth = 32
		  mTileHeight = 32
		  Self.Map = New GameKit.SquareMap(TileData, mTileWidth, mTileHeight, 0, 0)
		  
		  // Due to a limitation with Xojo, at this point in the Canvas' lifetime, it doesn't 
		  // have a width or a height. We'll therefore create a viewport with a size of 1 x 1 (the minimum) 
		  // and adjust the viewport size of the camera to match the size of the Canvas in its 
		  // enclosing window later.
		  Self.Map.SetCamera(New GameKit.Camera(New Rect(0, 0, 1, 1)))
		  
		  // Register this Canvas as an observer to the notifications posted by the map.
		  Self.Map.AddObserver(Self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateTiles(numRows As Integer, numColumns As Integer)
		  ///
		  ' Creates a test map of tiles.
		  ' Randomises the placement of tiles.
		  ///
		  
		  Self.TileData = New GameKit.MapDataSource(numRows, numColumns)
		  
		  // Add the tiles to the data source.
		  For col As Integer = 0 to numColumns - 1
		    For row As Integer = 0 To numRows - 1
		      // Randomise some tiles to be walls. The rest will be empty.
		      Var tileType As NavDemoTile.TileTypes
		      Select Case System.Random.InRange(1, 10)
		      Case 1 To 8 // Favour empty tiles.
		        tileType = NavDemoTile.TileTypes.Empty
		      Else
		        tileType = NavDemoTile.TileTypes.Wall
		      End Select
		      
		      // Create a new tile and add this canvas as an observer to its activity.
		      Var t As New NavDemoTile(tileType)
		      t.AddObserver(Self)
		      
		      // Add this tile to the data set.
		      Self.TileData.Set(t, row, col)
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
		  Case GameKit.Events.TileDidRender
		    // A tile has rendered itself to this Canvas.
		    TileDidRender(notification.Data.Value("tile"), notification.Data.Value("graphics"), _
		    notification.Data.Value("x"), notification.Data.Value("y"), _
		    notification.Data.Value("width"), notification.Data.Value("height"))
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
		  
		  Self.Map.SetAnchor(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206D617027732063616D65726120696E20746865205820646972656374696F6E2E20506F736974697665206D6F7665732069742072696768742C206E65676174697665206C6566742E
		Sub TranslateMapCamera(x As Double, y As Double)
		  ///
		  ' Translates the map's camera in the (X,Y) direction.
		  '
		  ' - Parameter x: The number of pixels to move the camera in the X direction. Positive moves it right.
		  ' - Parameter y: The number of pixels to move the camera in the Y direction. Positive moves it down.
		  ///
		  
		  If Self.Map.Camera <> Nil Then Self.Map.Camera.Translate(x, y)
		  
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

	#tag Hook, Flags = &h0, Description = 4669726564207768656E6576657220612074696C652072656E6465727320697473656C6620746F20746869732043616E7661732E
		Event TileDidRender(t As GameKit.Tile, g As Graphics, x As Double, y As Double, width As Double, height As Double)
	#tag EndHook


	#tag Property, Flags = &h0
		Map As GameKit.SquareMap
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 49662054727565207468656E207468652063616E7661732072657175697265732072657061696E74696E6720617420746865206E6578742060557064617465602063616C6C2E
		Private mNeedsUpdating As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTileHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTileWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		TileData As GameKit.MapDataSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTileHeight
			End Get
		#tag EndGetter
		TileHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTileWidth
			End Get
		#tag EndGetter
		TileWidth As Double
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="TileWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TileHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
