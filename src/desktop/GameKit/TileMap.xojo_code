#tag Class
Protected Class TileMap
Inherits GameKit.Node
Implements GameKit.IGraph
	#tag Method, Flags = &h0, Description = 52657475726E73206120636C6F6E65206F662074686973206D6170277320616E63686F7220506F696E742E
		Function Anchor() As Point
		  ///
		  ' Returns a clone of this map's anchor Point.
		  ///
		  
		  Return mAnchor.Clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(dataSource As GameKit.MapDataSource, tileWidth As Integer, tileHeight As Integer, anchorX As Double, anchorY As Double)
		  ///
		  ' Constructs a new base tile map.
		  '
		  ' - Parameter dataSource: The data source to use for this map.
		  ' - Parameter tileWidth: The width (in pixels) of a tile.
		  ' - Parameter tileHeight: The height (in pixels) of a tile.
		  ' - Parameter anchorX: The X coordinate to draw the top left of this map in its containing Canvas.
		  ' - Parameter anchorY: The Y coordinate to draw the top left of this map in its containing Canvas.
		  '
		  ' - Notes:
		  ' This class is not intended to be instantiated. It serves as a base class for other tile maps.
		  ///
		  
		  Super.Constructor
		  
		  // Validate the arguments.
		  If tileWidth <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_INVALID_TILE_WIDTH)
		  ElseIf tileHeight <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_INVALID_TILE_HEIGHT)
		  ElseIf dataSource = Nil Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_NIL)
		  End If
		  
		  mTileWidth = tileWidth
		  mTileHeight = tileHeight
		  
		  mAnchor = New Point(anchorX, anchorY)
		  
		  // Assign the tile data source and observe its notifications.
		  TileData = dataSource
		  TileData.AddObserver(Self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520686569676874206F662074686973206D617020696E20706978656C73206966206974207765726520746F20626520647261776E20696E2069747320656E7469726574792E
		Function Height() As Double
		  ///
		  ' Returns the height of this map in pixels if it were to be drawn in its entirety.
		  ///
		  
		  Return mTileHeight * Self.TileData.NumberOfRows
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexAtXY(x As Double, y As Double) As GameKit.GridIndex
		  ///
		  ' - Note: Should be overridden by subclasses.
		  ///
		  
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Raise New UnsupportedOperationException(GameKit.Messages.METHOD_MUST_BE_OVERRIDDEN)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Neighbours(node As GameKit.IGraphNode) As GameKit.IGraphNode()
		  ///
		  ' - Note: Part of the GameKit.Navigation.Graph interface.
		  ///
		  
		  #Pragma Unused node
		  
		  Raise New UnsupportedOperationException(GameKit.Messages.METHOD_MUST_BE_OVERRIDDEN)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 412047616D654B6974206E6F74696669636174696F6E20686173206265656E2072656365697665642E
		Sub NotificationReceived(notification As GameKit.Notification)
		  ///
		  ' - Parameter notification: The notification received.
		  '
		  ' - Note: Part of the GameKit.IObserver interface.
		  ///
		  
		  Select Case notification.EventType
		  Case GameKit.Events.CameraViewportDidResize
		    // This map's camera's viewport has resized.
		    If Self.AllowOverScrolling = False Then
		      // Update the constraints as the viewport size has changed. We do this by calling the 
		      // `AllowOverScrolling` computed setter.
		      Self.AllowOverScrolling = False
		    End If
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As graphics, x As Double, y As Double, width As Double, height As Double)
		  ///
		  ' - Raises: UnsupportedOperationException.
		  '
		  ' - Notes: 
		  ' Part of the GameKit.IRenderable interface.
		  ' Must be overridden by subclasses.
		  ///
		  
		  #Pragma Unused g
		  #Pragma Unused x
		  #Pragma Unused y
		  #Pragma Unused width
		  #Pragma Unused height
		  
		  Raise New UnsupportedOperationException(GameKit.Messages.METHOD_MUST_BE_OVERRIDDEN)
		  
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
		  ' - Notifies: TileMapAnchorDidChange
		  ' - Note: (0, 0) is the top-left corner.
		  ///
		  
		  // Construct the notification we will send before we modify the anchor 
		  // so we can send the previous values.
		  Var n As GameKit.Notification
		  n = GameKit.CreateNotification.TileMapAnchorDidChange(Self, New Point(mAnchor.X, mAnchor.Y))
		  
		  // Modify the anchor.
		  Self.mAnchor.X = x
		  Self.mAnchor.Y = y
		  
		  // Notify observers of the change.
		  Notify(n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320746865207061737365642063616D65726120746F20746869732074696C65206D61702E
		Sub SetCamera(c As GameKit.Camera)
		  ///
		  ' Sets the passed camera to be the camera for this map.
		  '
		  ' - Parameter c: The camera to assign.
		  ///
		  
		  Self.Camera = c
		  
		  // Register ourselves as an observer of the camera's activity.
		  Self.Camera.AddObserver(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520686569676874206F66207468652074696C657320696E2074686973206D617020696E20706978656C732E
		Function TileHeight() As Double
		  ///
		  ' Returns the height of the tiles in this map in pixels.
		  ///
		  
		  Return mTileHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207769647468206F66207468652074696C657320696E2074686973206D617020696E20706978656C732E
		Function TileWidth() As Double
		  ///
		  ' Returns the width of the tiles in this map in pixels.
		  ///
		  
		  Return mTileWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207769647468206F662074686973206D617020696E20706978656C73206966206974207765726520746F20626520647261776E20696E2069747320656E7469726574792E
		Function Width() As Double
		  ///
		  ' Returns the width of this map in pixels if it were to be drawn in its entirety.
		  ///
		  
		  Return mTileWidth * Self.TileData.NumberOfColumns
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 49662046616C7365207468656E20746865206D617027732063616D65726127732076696577706F72742063616E6E6F74206D6F766520706173742074686520626F756E6473206F6620746865206D61702E
		#tag Getter
			Get
			  Return mAllowOverScrolling
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Enable or disable a constraint on the camera so it won't scroll past the edge of the map.
			  
			  If value Then
			    mAllowOverScrolling = True
			    Self.Camera.RemoveConstraints
			  Else
			    mAllowOverScrolling = False
			    
			    // Top left corner of the map.
			    Var min As Point = New Point(0, 0)
			    
			    // Bottom right corner.
			    Var max As Point = New Point(Self.Width - Self.Camera.Viewport.Width, _
			    Self.Height - Self.Camera.Viewport.Height)
			    
			    // Set the constraint.
			    Self.Camera.ConstrainOrigin(min, max)
			  End If
			  
			End Set
		#tag EndSetter
		AllowOverScrolling As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0, Description = 5468652076696577706F7274206F662074686973206D617020696E2069747320636F6E7461696E696E67204772617068696373206F626A6563742E2053706563696669657320746865206865696768742C20776964746820616E64206F726967696E2E
		Camera As GameKit.Camera
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAllowOverScrolling As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mAnchor As Point
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 54686520686569676874206F6620612074696C6520696E2074686973206D61702E
		Protected mTileHeight As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 546865207769647468206F6620612074696C6520696E2074686973206D61702E
		Protected mTileWidth As Double = 0
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
			InitialValue="-2147483648"
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
			Name="AllowOverScrolling"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
