#tag Class
Protected Class SquareMap
Inherits GameKit.TileMap
	#tag Method, Flags = &h21, Description = 436F6D70757465732074686520696E6465786573206F662074686520746F70206C65667420616E642074686520626F74746F6D2072696768742076697369626C652074696C657320616E642074686520582C2059207363726F6C6C206F6666736574732E
		Private Sub ComputeVisibleTileIndexes()
		  ///
		  ' Computes the indexes of the top left and the bottom right visible tiles and the X, Y scroll offsets.
		  ' This data is needed to draw the visible tiles.
		  '
		  ' - Note: Assumes that `Self.Camera` is not Nil.
		  ///
		  
		  Using GameKit.Maths
		  
		  // Cache the camera's viewport origin coordinates to save a lookup.
		  Var cvox As Double = Camera.Viewport.Origin.X
		  Var cvoy As Double = Camera.Viewport.Origin.Y
		  
		  // Top left column
		  mTLC = Floor(cvox / mTileWidth)
		  mTLC = Clamp(mTLC, 0, TileData.NumberOfColumns - 1)
		  
		  // Top left row.
		  mTLR = Floor(cvoy / mTileHeight)
		  mTLR = Clamp(mTLR, 0, TileData.NumberOfRows - 1)
		  
		  // Bottom right column
		  mBRC = (mTLC + Camera.Viewport.Width / mTileWidth) + 1
		  mBRC = Clamp(mBRC, 0, TileData.NumberOfColumns - 1)
		  
		  // Bottom right row.
		  mBRR = (mTLR + Camera.Viewport.Height / mTileHeight) + 1
		  mBRR = Clamp(mBRR, 0, TileData.NumberOfRows - 1)
		  
		  // Compute the scroll offsets.
		  mScrollOffsetX = -cvox + (mTLC * mTileWidth)
		  mScrollOffsetY = -cvoy + (mTLR * mTileHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(dataSource As GameKit.MapDataSource, tileWidth As Integer, tileHeight As Integer, anchorX As Double, anchorY As Double)
		  ///
		  ' - Parameter dataSource: The data source for this map.
		  ' - Parameter tileWidth: The width of a tile in pixels.
		  ' - Parameter tileHeight: The height of a tile in pixels.
		  ' - Parameter anchorX: The X coordinate to draw the top left of this map in its containing Canvas.
		  ' - Parameter anchorY: The Y coordinate to draw the top left of this map in its containing Canvas.
		  ///
		  
		  // Validate the arguments.
		  If dataSource = Nil Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_NIL)
		  End If
		  
		  // Call the overridden superclass constructor.
		  Super.Constructor(dataSource, tileWidth, tileHeight, anchorX, anchorY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54656C6C732074686973206D617020746861742069742073686F756C6420636F6D706C6574656C792072656472617720697473656C662C20666C757368696E6720616E7920636163686573206974206D617920686176652E
		Sub ForceRedraw()
		  ///
		  ' Tells this map that it should completely redraw itself, flushing any caches it may have.
		  ///
		  
		  mNeedsCompleteRedraw = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652074696C6520696E646578206174207468652073706563696669656420636F6F7264696E617465206F72204E696C206966207468657265206973206E6F6E652E205820616E642059206172652072656C617469766520746F20746865206D617027732063616D6572612773206F726967696E2E
		Function IndexAtXY(x As Double, y As Double) As GameKit.GridIndex
		  ///
		  ' Returns the grid index at the specified coordinate or Nil if there is none. 
		  '
		  ' - Parameter x: The X coordinate relative to the camera's origin.
		  ' - Parameter y: The Y coordinate relative to the camera's origin.
		  '
		  ' - Returns: GridIndex or Nil if there is no tile at the coordinates.
		  '
		  ' - Note: Overrides TileMap.IndexAtXY
		  ///
		  
		  Var row As Integer = Floor((Camera.Viewport.Origin.Y + y) / mTileHeight)
		  Var column As Integer = Floor((Camera.Viewport.Origin.X + x) / mTileWidth)
		  
		  If row < 0 Or row >= TileData.NumberOfRows Or column < 0 Or column >= TileData.NumberOfColumns Then
		    Return Nil
		  Else
		    Return New GameKit.GridIndex(row, column)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54616B657320612053717561726554696C6520616E642072657475726E7320697473206E65696768626F7572696E672074696C657320617320616E206172726179206F662053717561726554696C65732E2052616973657320616E20496E76616C6964417267756D656E74457863657074696F6E206973206E6F6465206973204E4F5420612053717561726554696C652E
		Function Neighbours(node As GameKit.IGraphNode) As GameKit.IGraphNode()
		  ///
		  ' Returns the 8 tiles surrounding the passed tile.
		  '
		  ' - Parameter node: The tile whose neighbours we want.
		  '
		  ' - Notes:
		  ' Part of the GameKit.Navigation.Graph interface.
		  ' Expects the passed node to be a GameKit.Tile (GameKit.Tile implements the IGraphNode interface).
		  ///
		  
		  // Expects a GameKit.Tile.
		  If node IsA GameKit.Tile = False Then
		    Raise New InvalidArgumentException("Expected a GameKit.Tile.")
		  End If
		  
		  // Validate the tile's index.
		  Var t As GameKit.Tile = GameKit.Tile(node)
		  If t.Column < 0 Or t.Column > Self.TileData.NumberOfColumns - 1 Then
		    Raise New InvalidArgumentException("The requested column (" + t.Column.ToString + ") is out of range.")
		  End If
		  If t.Row < 0 Or t.Row > Self.TileData.NumberOfRows - 1 Then
		    Raise New InvalidArgumentException("The requested row (" + t.Row.ToString + ") is out of range.")
		  End If
		  
		  // Return (at most) the surrounding 8 tiles. Note: GameKit.Tiles are also IGraphNodes.
		  Var tilesToReturn() As GameKit.Tile
		  For i As Integer = -1 To 1
		    For j As Integer = -1 To 1
		      // Don't return the tile whose neighbours we're looking for!
		      If i = 0 And j = 0 Then Continue
		      
		      // Add this tile if it exists in the data store.
		      Var tmp As GameKit.Tile = TileData.Get(t.Row + j, t.Column + i)
		      If tmp <> Nil Then tilesToReturn.AddRow(tmp)
		      
		    Next j
		  Next i
		  
		  Return tilesToReturn
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 412047616D654B6974206E6F74696669636174696F6E20686173206265656E2072656365697665642E
		Sub NotificationReceived(notification As GameKit.Notification)
		  /// 
		  ' A GameKit notification has been received.
		  '
		  ' - Parameter notification: The notification.
		  '
		  ' - Notes: 
		  ' Part of the GameKit.IObserver interface.
		  ' Overrides Super.NotificationReceived
		  ///
		  
		  // Make sure the base class receives the notification first.
		  Super.NotificationReceived(notification)
		  
		  Select Case notification.EventType
		    
		  Case GameKit.Events.CameraDidMove, _
		    GameKit.Events.CameraViewportDidResize
		    // Requires a complete redraw of the viewport
		    mNeedsCompleteRedraw = True
		    
		    // Notify observers that the visible map has changed.
		    Notify(GameKit.CreateNotification.TileMapAppearanceDidChange(Self))
		    
		  Case GameKit.Events.TileDidChange
		    // Only need to redraw the map if the tile that has changed is within the current viewport.
		    Var t As GameKit.Tile = notification.Data.Value("tile")
		    If TileWithinViewport(t.Row, t.Column) Then
		      mNeedsCompleteRedraw = True
		      
		      // Notify observers that the visible map has changed.
		      Notify(GameKit.CreateNotification.TileMapAppearanceDidChange(Self))
		    End If
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 436F6D706C6574656C7920726564726177732065766572792076697369626C652074696C6520696E207468652063757272656E742076696577706F727420746F20746865206275666665722E
		Private Sub RedrawViewport(g As Graphics)
		  ///
		  ' Completely redraws every visible tile in the current viewport to the passed Graphics object.
		  '
		  ' - Parameter g: The Graphics object to draw to.
		  ///
		  
		  // Can't draw if there's no camera.
		  If Self.Camera = Nil Then Return
		  
		  // Compute the top left and bottom right visible tile indexes.
		  ComputeVisibleTileIndexes
		  
		  // Create a new Picture to cache the map to after we've drawn it.
		  // If bleeding is disallowed then constrain the cache dimensions to match the viewport.
		  If AllowBleeding Then
		    mCachedViewport = New Picture(Me.Width, Me.Height)
		  Else
		    mCachedViewport = New Picture(Me.Camera.Viewport.Width, Me.Camera.Viewport.Height)
		  End If
		  
		  // Tell the visible tiles to draw themselves to the buffer.
		  #Pragma BoundsChecking False
		  #Pragma StackOverflowChecking False
		  Var x, y As Integer
		  
		  For col As Integer = mTLC To mBRC
		    For row As Integer = mTLR To mBRR
		      // Compute the X coordinate of the top left corner of this tile.
		      x = (col - mTLC) * mTileWidth + mScrollOffsetX
		      
		      // Compute the Y coordinate of the top left corner of this tile.
		      y = (row - mTLR) * mTileHeight + mScrollOffsetY
		      
		      If AllowBleeding Then
		        // Render this tile to the current Graphics context.
		        TileData.Get(row, col).Render(g, x + Anchor.X, y + Anchor.Y, mTileWidth, mTileHeight)
		        // Render this tile to the cache.
		        TileData.Get(row, col).Render(mCachedViewport.Graphics, x, y, mTileWidth, mTileHeight)
		      Else
		        // Just render this tile to the cache.
		        TileData.Get(row, col).Render(mCachedViewport.Graphics, x, y, mTileWidth, mTileHeight)
		      End If
		    Next row
		  Next col
		  
		  mNeedsCompleteRedraw = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261772074686973206D617020746F2074686520706173736564204772617068696373206F626A6563742E
		Sub Render(g As graphics, x As Double = 0, y As Double = 0, width As Double = 0, height As Double = 0)
		  ///
		  ' Draw this map to the passed Graphics object.
		  '
		  ' We need to draw the portion of the map that is currently visible in our camera's viewport .
		  ' The viewport's origin is drawn at the anchor point on the passed Graphics object.
		  ' The viewport's origin represents is the (x, y) position of the top-left cornerm of the viewport within the entire map.
		  ' The width and height of the viewport describe the size of the map that is visible.
		  '
		  ' - Parameter g: The Graphics object that should be drawn to.
		  '
		  ' - Notes: 
		  ' Part of the GameKit.IRenderable interface. `x`, `y`, `w`idth` and `height` are part of this interface and are not required.
		  ' Overrides TileMap.Render
		  ///
		  
		  #Pragma Unused x
		  #Pragma Unused y
		  #Pragma Unused width
		  #Pragma Unused height
		  
		  // First check to see if this tile map has a valid camera. It can't draw if it doesn't.
		  If Self.Camera = Nil Then Return
		  
		  // Either redraw the entire viewport or, if nothing has changed, reuse the cached viewport.
		  If mNeedsCompleteRedraw Then
		    RedrawViewport(g)
		    
		    // If bleeding is disallowed then draw the cached viewport (created in `RedrawViewport`)
		    // to the passed Graphics object.
		    If Not AllowBleeding Then g.DrawPicture(mCachedViewport, Anchor.X, Anchor.Y)
		  Else
		    // Nothing has changed so just draw the cached viewport to the passed Graphics object.
		    g.DrawPicture(mCachedViewport, Anchor.X, Anchor.Y)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732054727565206966207468652074696C6520617420746865207370656369666965642028726F772C20636F6C756D6E2920696E6465782069732063757272656E746C792076697369626C6520617420616C6C20696E207468652076696577706F72742E
		Private Function TileWithinViewport(row As Integer, column As Double) As Boolean
		  ///
		  ' Returns True if the tile at the specified (row, column) index is currently visible in the viewport.
		  '
		  ' - Parameter row: The 0-based row.
		  ' - Parameter column: The 0-based column.
		  
		  ' - Note: A tile is considered visible if any part of it is within the current viewport.
		  ///
		  
		  If row < mTLR Or row > mBRR Or column < mTLC Or column > mBRR Then
		    Return False
		  Else
		    Return True
		  End If
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 49662054727565207468656E206120627566666572206F662074696C65732061726F756E64207468652065646765206F66207468652076697369626C652076696577706F72742077696C6C20616C736F20626520647261776E2E205468652064656661756C7420697320547275652E
		AllowBleeding As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 52657475726E732074686520696E646578206F662074686520626F74746F6D2072696768742074696C6520746861742069732063757272656E746C792076697369626C652E
		#tag Getter
			Get
			  Return New GridIndex(mBRR, mBRC)
			End Get
		#tag EndGetter
		BottomRightVisibleTileIndex As GameKit.GridIndex
	#tag EndComputedProperty

	#tag Property, Flags = &h21, Description = 54686520302D626173656420636F6C756D6E206F662074686520626F74746F6D2072696768742074696C652076697369626C652E20557365642062792060436F6D7075746556697369626C6554696C65496E6465786573602E
		Private mBRC As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520302D626173656420726F77206F662074686520626F74746F6D2072696768742076697369626C652074696C652E20557365642062792060436F6D7075746556697369626C6554696C65496E6465786573602E
		Private mBRR As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 41206361636865642050696374757265206F66207468652074696C65206D617020666F6C6C6F77696E6720697473206C61737420636F6D706C657465207265647261772E
		Private mCachedViewport As Picture
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 49662054727565207468656E207468652076696577706F7274206E6565647320746F206265207265647261776E2E
		Private mNeedsCompleteRedraw As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 55736564207768656E20636F6D707574696E6720746865205820636F6F7264696E617465206F662074696C6573206265696E6720647261776E207768656E2072656E646572696E6720746865206D61702E2049742773206166666563746564206279207468652063616D65726127732076696577706F72742773206F726967696E2E
		Private mScrollOffsetX As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 55736564207768656E20636F6D707574696E6720746865205920636F6F7264696E617465206F662074696C6573206265696E6720647261776E207768656E2072656E646572696E6720746865206D61702E2049742773206166666563746564206279207468652063616D65726127732076696577706F72742773206F726967696E2E
		Private mScrollOffsetY As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520302D626173656420636F6C756D6E206F662074686520746F70206C6566742074696C652076697369626C652E20557365642062792060436F6D7075746556697369626C6554696C65496E6465786573602E
		Private mTLC As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520302D626173656420726F77206F662074686520746F70206C6566742074696C652076697369626C652E20557365642062792060436F6D7075746556697369626C6554696C65496E6465786573602E
		Private mTLR As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 52657475726E732074686520696E646578206F662074686520746F70206C6566742074696C6520746861742069732063757272656E746C792076697369626C652E
		#tag Getter
			Get
			  Return New GridIndex(mTLR, mTLC)
			End Get
		#tag EndGetter
		TopLeftVisibleTileIndex As GameKit.GridIndex
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowOverScrolling"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
			Name="AllowBleeding"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
