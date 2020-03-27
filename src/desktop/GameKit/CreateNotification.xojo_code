#tag Class
Protected Class CreateNotification
	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206043616D65726132444469644D6F766560204E6F74696669636174696F6E2E
		Shared Function CameraDidMove(sender As GameKit.Camera, oldViewportOriginX As Double, oldViewportOriginY As Double) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `CameraDidMove` Notification.
		  '
		  ' - Parameter sender: The camera that moved.
		  ' - Parameter oldViewportOriginX: The X coordinate of the camera's viewport origin before the move.
		  ' - Parameter oldViewportOriginY: The Y coordinate of the camera's viewport origin before the move.
		  ///
		  
		  Var n As GameKit.Notification = New GameKit.Notification(sender, GameKit.Events.CameraDidMove)
		  n.Data.Value("oldViewportOrigin") = New Point(oldViewportOriginX, oldViewportOriginY)
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206043616D657261324456696577706F7274446964526573697A6560204E6F74696669636174696F6E2E
		Shared Function CameraViewportDidResize(sender As GameKit.Camera, oldViewportWidth As Double, oldViewportHeight As Double) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `CameraViewportDidResize` Notification.
		  '
		  ' - Parameter sender: The camera that moved.
		  ' - Parameter oldViewportWidth: The width of the camera's viewport before the resize.
		  ' - Parameter oldViewportHeight: The height of the camera's viewport before the resize.
		  ///
		  
		  Var n As GameKit.Notification = New GameKit.Notification(sender, GameKit.Events.CameraViewportDidResize)
		  n.Data.Value("previousViewportWidth") = oldViewportWidth
		  n.Data.Value("previousViewportHeight") = oldViewportHeight
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  ///
		  ' Prevents instantiation of this class.
		  ///
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206054696C654469644368616E676560204E6F74696669636174696F6E2E
		Shared Function TileDidChange(sender As GameKit.ISubject, tile As GameKit.Tile) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `TileDidChange` Notification.
		  '
		  ' - Parameter sender: The ISubject sending the notification.
		  ' - Parameter tile: The tile that has changed.
		  ///
		  
		  Var n As GameKit.Notification = New GameKit.Notification(sender, GameKit.Events.TileDidChange)
		  n.Data.Value("tile") = tile
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206054696C6544696452656E64657260204E6F74696669636174696F6E2E
		Shared Function TileDidRender(sender As GameKit.ISubject, t As GameKit.Tile, g As Graphics, x As Double, y As Double, width As Double, height As Double) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `TileDidRender` Notification.
		  '
		  ' - Parameter sender: The ISubject sending this notification.
		  ' - Parameter g: The Graphics object that this tile just rendered to.
		  ' - Parameter t: The tile that has just rendered.
		  ' - Parameter row: This tile's 0-based row.
		  ' - Parameter column: This tile's 0-based column.
		  ' - Parameter x: The top left corner X coordinate of the tile on the Graphics object.
		  ' - Parameter y: The top left corner Y coordinate of the tile on the Graphics object.
		  ' - Parameter width: The width of the tile in pixels.
		  ' - Parameter height: The height of the tile in pixels.
		  ///
		  
		  Var n As GameKit.Notification = New GameKit.Notification(sender, GameKit.Events.TileDidRender)
		  n.Data.Value("tile") = t
		  n.Data.Value("graphics") = g
		  n.Data.Value("x") = x
		  n.Data.Value("y") = y
		  n.Data.Value("width") = width
		  n.Data.Value("height") = height
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206054696C654D6170416E63686F724469644368616E676560204E6F74696669636174696F6E2E
		Shared Function TileMapAnchorDidChange(sender As GameKit.TileMap, previousAnchor As Point) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `TileMapAnchorDidChange` Notification.
		  '
		  ' - Parameter sender: The TileMap that has changed.
		  ' - Parameter previousAnchor: The previous anchor Point before it was changed.
		  ///
		  
		  Var n As GameKit.Notification
		  n = New GameKit.Notification(sender, GameKit.Events.TileMapAnchorDidChange)
		  n.Data.Value("previousAnchor") = previousAnchor
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4120636F6E76656E69656E6365206D6574686F6420666F72206372656174696E672061206E6577206054696C654D6170417070656172616E63654469644368616E676560204E6F74696669636174696F6E2E
		Shared Function TileMapAppearanceDidChange(sender As GameKit.TileMap) As GameKit.Notification
		  ///
		  ' A convenience method for creating a new `TileMapAppearanceDidChange` Notification.
		  '
		  ' - Parameter sender: The TileMap that has changed.
		  ///
		  
		  Return New GameKit.Notification(sender, GameKit.Events.TileMapAppearanceDidChange)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is a factory class which provides convenient shared methods for creating notifications.
		The advantage of using the factory class is that the compiler will ensure that the correct 
		data values are included with each notification.
		
		
	#tag EndNote


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
	#tag EndViewBehavior
End Class
#tag EndClass
