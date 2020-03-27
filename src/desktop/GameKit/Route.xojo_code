#tag Class
Protected Class Route
	#tag Method, Flags = &h0
		Sub Constructor(steps() As GameKit.IGraphNode, routeCost As Double)
		  // Clone the passed array.
		  For Each gn As GameKit.IGraphNode In steps
		    mSteps.AddRow(gn)
		  Next gn
		  
		  mCost = routeCost
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F7374206F66207468697320726F7574652E
		Function Cost() As Double
		  ///
		  ' Returns the cost of this route.
		  ///
		  
		  Return mCost
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C656E677468206F66207468697320726F75746520286E756D626572206F662047726170684E6F64657320746F207472617665727365292E204F6E65206C65737320746861742074686520746F74616C206E756D626572206F66206E6F6465732028617320776520646F6E277420636F756E7420746865207374617274206E6F6465292E
		Function Length() As Integer
		  ///
		  ' Returns the length of this route (number of GraphNodes to traverse).
		  '
		  ' - Notes:
		  ' The length is one less than the total number of steps as we don't need to count the start node.
		  ///
		  
		  Return mSteps.Count - 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520737465707320696E207468697320726F75746520617320616E206172726179206F662047726170684E6F64657320746F206265207472617665727365642E20496E64657820603060206973207468652064657374696E6174696F6E20616E6420604C617374526F77496E64657860206973207468652073746172742E
		Function Steps() As GameKit.IGraphNode()
		  ///
		  ' Returns the steps in this route as an array of GraphNodes to be traversed. 
		  ' Index `0` is the destination and `LastRowIndex` is the start.
		  '
		  ' - Notes:
		  ' A reference to the internal mSteps array is returned, therefore modifying 
		  ' the returned array will alter it.
		  ///
		  
		  Return mSteps
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652047726170684E6F64652073746570206174207468652073706563696669656420696E6465782E
		Function Steps(index As Integer) As GameKit.IGraphNode
		  ///
		  ' Returns the GraphNode step at the specified index.
		  ' Index `0` is the destination and `LastRowIndex` is the start.
		  '
		  ' - Notes:
		  ' A reference to the element in theinternal `mSteps` array is returned, 
		  ' therefore modifying it will alter `mSteps` too.
		  ///
		  
		  If index < 0 Or index> mSteps.LastRowIndex Then
		    Raise New OutOfBoundsException("Invalid index")
		  End If
		  
		  Return mSteps(index)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 4361636865206F662074686520636F7374206F66207468697320726F7574652E
		Private mCost As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520737465707320696E207468697320726F7574652E2060537465707328302960206973207468652064657374696E6174696F6E206E6F646520616E64206053746570732853746570732E4C617374526F77496E646578296020697320746865207374617274206E6F64652E
		Private mSteps() As GameKit.IGraphNode
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
	#tag EndViewBehavior
End Class
#tag EndClass
