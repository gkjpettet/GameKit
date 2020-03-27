#tag Class
Protected Class RouteFinder
Inherits GameKit.Node
Implements GameKit.IGraphNode
	#tag Method, Flags = &h0, Description = 52657475726E732074686520726F757465206265747765656E2074776F206E6F646573206F72204E696C206966206E6F20726F7574652063616E20626520666F756E642E
		Shared Function FindRoute(graph As GameKit.IGraph, from As GameKit.IGraphNode, goal As GameKit.IGraphNode, traveller As GameKit.IGraphTraveller) As GameKit.Route
		  ///
		  ' Returns the route between two nodes.
		  '
		  ' - Parameter graph: The graph to search.
		  ' - Parameter from: The node to start the search from.
		  ' - Parameter goal: The node we want to get to.
		  ' - Parameter traveller: The GraphTraveller that is traversing the graph.
		  '
		  ' - Returns: A Route or Nil if no valid route can be found.
		  ///
		  
		  Using GameKit.Utils
		  
		  // First check to see if the goal is passable.
		  If Not traveller.Passable(goal) Then Return Nil
		  
		  Var frontier As PriorityQueue = New PriorityQueue
		  Var allNodes As Dictionary = New Dictionary // GraphNode:GraphNode
		  
		  // Create a starting RouteNode from the `from` GraphNode. There is no preceding node, the 
		  // score for the current route is 0 and the estimated route to the goal will be computed by 
		  // the passed GraphTraveller.
		  Var start As GameKit.RouteNode
		  start = New GameKit.RouteNode(from, Nil, 0, traveller.ComputeCostToGoal(graph, from, goal))
		  
		  // Put this start RouteNode on the frontier.
		  frontier.Enqueue(start, start.EstimatedScore)
		  
		  // Store that we have visited the `from` node.
		  allNodes.Value(from) = start
		  
		  // Keep searching until the frontier is empty.
		  While Not frontier.IsEmpty
		    
		    // Get the next node to consider.
		    Var consider As GameKit.RouteNode = frontier.Dequeue
		    
		    If consider.Current Is goal Then
		      Var routeScore As Double = consider.RouteScore
		      // We've found our route. Create an array of the GraphNodes that comprise the route.
		      // index 0 is the goal and the highest index is the starting node.
		      Var steps() As GameKit.IGraphNode
		      Var aNode As GameKit.RouteNode = consider
		      While aNode <> Nil
		        steps.AddRow(aNode.Current)
		        aNode = allNodes.Lookup(aNode.Previous, Nil)
		      Wend
		      Return New GameKit.Route(steps, routeScore)
		    End If
		    
		    // The node under consideration isn't the goal. Check its neighbours.
		    Var n As GameKit.RouteNode
		    For Each neighbour As GameKit.IGraphNode In graph.Neighbours(consider.Current)
		      // First check to see if this neighbour is passable by this traveller.
		      If Not traveller.Passable(neighbour) Then Continue
		      
		      n = allNodes.Lookup(neighbour, New GameKit.RouteNode(neighbour))
		      allNodes.Value(neighbour) = n
		      
		      // Compute the cost of the route to get to this neighbour from the node being considered.
		      Var routeScore As Double = _
		      consider.RouteScore + traveller.ComputeCostToNeighbour(graph, consider.Current, neighbour)
		      
		      // Would moving to this neighbour be cheaper than what we have so far?
		      If routeScore < n.RouteScore Then
		        n.Previous = consider.Current
		        n.RouteScore = routeScore
		        // The estimated score is the route score plus our estimate to the goal.
		        n.EstimatedScore = routeScore + traveller.ComputeCostToGoal(graph, neighbour, goal)
		        // Add this node to the frontier for consideration.
		        frontier.Enqueue(n, n.EstimatedScore)
		      End If
		    Next neighbour
		    
		  Wend
		  
		  // No route possible.
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Return "RouteFinder instance: " + Self.ID.ToString
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
