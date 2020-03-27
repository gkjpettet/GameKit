#tag Class
Protected Class NavDemoTraveller
Implements GameKit.IGraphTraveller
	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F7374206F66206D6F76696E672066726F6D2074686520706173736564206E6F646520746F2074686520676F616C2E
		Function ComputeCostToGoal(g As GameKit.IGraph, currentNode As GameKit.IGraphNode, goal As GameKit.IGraphNode) As Double
		  ///
		  ' Returns the cost of moving from the passed node to the goal.
		  '
		  ' - Parameter g: The graph we are traversing.
		  ' - Parameter currentNode: The GraphNode that the GraphTraveller is currently occupying.
		  ' - Parameter goal: The node in the passed Graph that we are trying to get to.
		  '
		  ' - Notes: 
		  ' Part of the GameKit.IGraphTraveller interface.
		  ' This traveller relies on the passed GraphNodes being GameKit.Tile subclasses.
		  ///
		  
		  #Pragma Unused g
		  
		  // The traveller only works for tiles so ensure that the passed GraphNodes are GameKit.Tiles.
		  If currentNode IsA GameKit.Tile = False Then
		    Raise New InvalidArgumentException("`currentNode` must be a GameKit.Tile or subclass.")
		  ElseIf goal IsA GameKit.Tile = False Then
		    Raise New InvalidArgumentException("`goal` must be a GameKit.Tile or subclass.")
		  End If
		  
		  // Cast the nodes to Tiles.
		  Var currentTile As GameKit.Tile = GameKit.Tile(currentNode)
		  Var goalTile As GameKit.Tile = GameKit.Tile(goal)
		  
		  // Return the Manhattan distance on a square grid.
		  Return Abs(currentTile.Column - goalTile.Column) + abs(currentTile.Row - goalTile.Row)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F7374206F66206D6F76696E672066726F6D2074686520706173736564206E6F646520746F20746865206E65696768626F7572696E67206E6F64652E
		Function ComputeCostToNeighbour(g As GameKit.IGraph, currentNode As GameKit.IGraphNode, neighbour As GameKit.IGraphNode) As Double
		  ///
		  ' Returns the cost of moving from the passed node to the neighbouring node.
		  '
		  ' - Parameter g: The graph we are traversing.
		  ' - Parameter currentNode: The GraphNode that the GraphTraveller is currently occupying.
		  ' - Parameter neighbour: The neighbouring node in the Graph to move to.
		  '
		  ' - Notes:
		  ' Part of the GameKit.IGraphTraveller interface.
		  ' Both currentNode and neighbour must be NavDemoTiles.
		  ///
		  
		  #Pragma Unused g
		  
		  If currentNode IsA NavDemoTile = False Then
		    Raise New InvalidArgumentException("`currentNode` must be a NavDemoTile.")
		  ElseIf neighbour IsA NavDemoTile = False Then
		    Raise New InvalidArgumentException("`neighbour` must be a NavDemoTile.")
		  End If
		  
		  Var cost As Double
		  
		  // Prefer tiles in this order:
		  // Empty > Grass > Mud > Water > Walls
		  Select Case NavDemoTile(neighbour).Type
		  Case NavDemoTile.TileTypes.Empty
		    cost = 1 // Low cost to encourage using empty tiles.
		  Case NavDemoTile.TileTypes.Grass
		    cost = 2
		  Case NavDemoTile.TileTypes.Mud
		    cost = 3
		  Case NavDemoTile.TileTypes.Wall
		    // This shouldn't happen as `Passable()` should prohibit it...
		    Return GameKit.Maths.POSITIVE_INFINITY
		  Case NavDemoTile.TileTypes.Water
		    cost = 4
		  Else
		    Raise New InvalidArgumentException("Unknown tile type.")
		  End Select
		  
		  // Prefer moving orthogonally rather than diagonally by a factor of 1.4142.
		  If NavDemoTile(currentNode).Column = NavDemoTile(neighbour).Column Or _
		    NavDemoTile(currentNode).row = NavDemoTile(neighbour).Row Then
		    Return cost
		  Else
		    Return cost + 1.4142
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746865207061737365642047726170684E6F6465206973207061737361626C6520627920746869732074726176656C6C65722E
		Function Passable(n As GameKit.IGraphNode) As Boolean
		  ///
		  ' Returns True if the passed GraphNode is passable by this traveller.
		  '
		  ' - Parameter n: The node in question.
		  ///
		  
		  // This traveller only works with NavDemoTile instances.
		  If n IsA NavDemoTile = False Then Return False
		  
		  // Everything except for walls is passable.
		  If NavDemoTile(n).Type = NavDemoTile.TileTypes.Wall Then
		    Return False
		  Else
		    Return True
		  End If
		  
		  
		End Function
	#tag EndMethod


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
