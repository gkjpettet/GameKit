#tag Interface
Protected Interface IGraphTraveller
	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F7374206F66206D6F76696E672066726F6D2074686520706173736564206E6F646520746F2074686520676F616C2E
		Function ComputeCostToGoal(g As GameKit.IGraph, currentNode As GameKit.IGraphNode, goal As GameKit.IGraphNode) As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F7374206F66206D6F76696E672066726F6D207468652063757272656E74206E6F646520746F2074686520706173736564206E65696768626F7572696E67206E6F64652E
		Function ComputeCostToNeighbour(g As GameKit.IGraph, currentNode As GameKit.IGraphNode, neighbour As GameKit.IGraphNode) As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686973206E6F6465206973207061737361626C65206279207468697320477261706854726176656C6C65722E
		Function Passable(n As GameKit.IGraphNode) As Boolean
		  
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
End Interface
#tag EndInterface
