#tag Class
Protected Class MapDataSource
Inherits GameKit.Node
Implements GameKit.ISubject
	#tag Method, Flags = &h0
		Sub Constructor(numberOfRows As Integer, numberOfColumns As Integer)
		  Super.Constructor
		  
		  mNumRows = numberOfRows
		  mNumColumns = numberOfColumns
		  mRowUbound = numberOfRows - 1
		  mColumnUbound = numberOfColumns - 1
		  mTiles.ResizeTo(mRowUbound, mColumnUbound)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E666F726D732074686973206461746120736F757263652074686174207468652074696C65206174207468652073706563696669656420696E64657820686173206265656E206D6F6469666965642E
		Sub DidModifyTileAtIndex(index As GameKit.GridIndex)
		  ///
		  ' Informs this data source that the tile at the specified index has been modified.
		  '
		  ' - Parameter index: The index of the tile that has been modified.
		  ///
		  
		  // Validate arguments.
		  If index = Nil Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_INDEX_NIL)
		  Else
		    DidModifyTileAtIndex(index.Row, index.Column)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E666F726D732074686973206461746120736F757263652074686174207468652074696C6520617420746865207370656369666965642028726F772C20636F6C756D6E2920696E64657820686173206265656E206D6F6469666965642E
		Sub DidModifyTileAtIndex(row As Integer, column As Integer)
		  ///
		  ' Informs this data source that the tile at the specified (row, column) index has been modified.
		  '
		  ' - Parameter row: The 0-based row index of the tile that has been modified.
		  ' - Parameter column: The 0-based column index of the tile that has been modified.
		  ///
		  
		  // Validate arguments.
		  If row < 0 Or row > mRowUbound Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_ROW_OUT_OF_BOUNDS)
		  ElseIf column < 0 Or column > mColumnUbound Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_COLUMN_OUT_OF_BOUNDS)
		  End If
		  
		  // Create and send a new notification, passing the tile as the data.
		  Notify(GameKit.CreateNotification.TileDidChange(Self, mTiles(row, column)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652074696C6520617420746865207265717565737465642028726F772C20636F6C756D6E2920696E6465782E204D61792072657475726E204E696C2E
		Function Get(index As GameKit.GridIndex) As GameKit.Tile
		  ///
		  ' Returns the tile at the specified index.
		  '
		  ' - Parameter index: The index of the tile to get.
		  '
		  '- Returns: The requested tile or Nil if `index` is out of bounds.
		  ///
		  
		  // Validate arguments.
		  If index = Nil Then Return Nil
		  If index.Row < 0 Or index.Row > mRowUbound Then Return Nil
		  If index.Column < 0 Or index.Column > mColumnUbound Then Return Nil
		  
		  // Return the tile.
		  Return mTiles(index.Row, index.Column)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652074696C6520617420746865207265717565737465642028726F772C20636F6C756D6E2920696E6465782E204D61792072657475726E204E696C2E
		Function Get(row As Integer, column As Integer) As GameKit.Tile
		  ///
		  ' Returns the tile at the specified (row, column) index.
		  '
		  ' - Parameter row: The 0-based row.
		  ' - Parameter column: The 0-based column.
		  '
		  '- Returns: The requested tile or Nil if `row` or `column` is out of bounds.
		  ///
		  
		  // Validate arguments.
		  If row < 0 Or row > mRowUbound Then
		    Return Nil
		  End If
		  If column < 0 Or column > mColumnUbound Then
		    Return Nil
		  End If
		  
		  // Return the tile.
		  Return mTiles(row, column)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320746865207061737365642074696C6520746F20746865207370656369666965642028726F772C20636F6C756D6E2920696E64657820696E20746865206461746120736F757263652E
		Sub Set(tile As GameKit.Tile, row As Integer, column As Integer)
		  ///
		  ' Assigns the passed tile to the specified (row, column) index in the data source.
		  '
		  ' - Parameter tile: The tile to assign.
		  ' - Parameter row: The 0-based row position to assign this tile to.
		  ' - Parameter column: The 0-based column position to assign this tile to.
		  ///
		  
		  // Validate arguments.
		  If row > mRowUbound Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_ROW_OUT_OF_BOUNDS)
		  End If
		  If column > mColumnUbound Then
		    Raise New InvalidArgumentException(GameKit.Messages.MAP_DATA_SOURCE_COLUMN_OUT_OF_BOUNDS)
		  End If
		  
		  tile.Row = row
		  tile.Column = column
		  mTiles(row, column) = tile
		  
		  // Notify observers that this tile has changed.
		  Notify(GameKit.CreateNotification.TileDidChange(Self, tile))
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnUbound As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumColumns As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumRows As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowUbound As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 28726F772C20636F6C756D6E29
		Private mTiles(-1,-1) As GameKit.Tile
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F6620636F6C756D6E73206F662074696C657320696E2074686973206461746120736F757263652E
		#tag Getter
			Get
			  Return mNumRows
			End Get
		#tag EndGetter
		NumberOfColumns As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F6620726F7773206F662074696C657320696E2074686973206461746120736F757263652E
		#tag Getter
			Get
			  Return mNumColumns
			  
			End Get
		#tag EndGetter
		NumberOfRows As Integer
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
			Name="NumberOfRows"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfColumns"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
