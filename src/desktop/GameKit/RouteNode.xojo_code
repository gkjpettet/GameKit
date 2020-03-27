#tag Class
Protected Class RouteNode
Implements GameKit.IGraphNode,GameKit.IUnique
	#tag Method, Flags = &h0
		Sub Constructor(current As GameKit.IGraphNode)
		  Constructor(current, Nil, GameKit.Maths.POSITIVE_INFINITY, GameKit.Maths.POSITIVE_INFINITY)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(current As GameKit.IGraphNode, previous As GameKit.IGraphNode, routeScore As Double, estimatedScore As Double)
		  ///
		  ' - Parameter routeScore: The cost of moving from `previous` to `current`.
		  ' - Parameter estimatedScore: The estimated cost of moving from `current` to the final destination.
		  ///
		  
		  mID = New GameKit.UUID
		  
		  Self.Current = current
		  Self.Previous = previous
		  Self.RouteScore = routeScore
		  Self.EstimatedScore = estimatedScore
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468697320526F7574654E6F6465277320756E69717565206964656E7469666965722E
		Function ID() As GameKit.UUID
		  ///
		  ' - Note: Part of the GameKit.IUnique interface.
		  //
		  
		  Return mID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' - Note: Part of the GameKit.IGraphNode interface.
		  ///
		  
		  Return "RouteNode instance: " + Self.ID.ToString
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652063757272656E74206E6F646520726570726573656E746564206279207468697320526F7574654E6F64652E
		Current As GameKit.IGraphNode
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520657374696D617465642073636F726520666F72206D6F76696E67206265747765656E2074686973206E6F646520616E64207468652064657374696E6174696F6E2E
		EstimatedScore As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mID As GameKit.UUID
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206E6F6465206265666F72652074686973206E6F64652E
		Previous As GameKit.IGraphNode
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F7374206F66206D6F76696E672066726F6D2074686520626567696E6E696E67206F662074686520726F75746520746F2074686973206E6F64652E
		RouteScore As Double = 0
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
			Name="EstimatedScore"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RouteScore"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
