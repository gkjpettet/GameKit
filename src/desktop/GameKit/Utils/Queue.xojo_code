#tag Class
Protected Class Queue
	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F6620656C656D656E747320696E20746869732071756575652E
		Function Count() As Integer
		  ///
		  ' Returns the number of elements in this queue.
		  ///
		  
		  Return mElements.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616E642072657475726E73207468652066726F6E7420656C656D656E74206F66207468652071756575652E204D617920726169736520616E204F75744F66426F756E6473457863657074696F6E2E
		Function Dequeue() As Variant
		  ///
		  ' Removes and returns the front element from the queue.
		  '
		  ' - Raises: OutOfBoundsException if there are no elements in this queue.
		  ///
		  
		  // Check for underflow.
		  If mElements.Count = 0 Then
		    Raise New OutOfBoundsException("There are no elements in the queue.")
		  End If
		  
		  // Get the first item.
		  Var item As Variant = mElements(0)
		  
		  // Remove the item from our internal storage array.
		  mElements.Remove(0)
		  
		  // Return the item.
		  Return item
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41646473207468652070617373656420656C656D656E7420746F2074686520656E64206F66207468652071756575652E
		Sub Enqueue(element As Variant)
		  ///
		  ' Adds the passed element to the end of the queue.
		  ///
		  
		  mElements.AddRow(element)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746865726520617265206E6F20656C656D656E747320696E20746869732071756575652E
		Function IsEmpty() As Boolean
		  ///
		  ' Returns True if there are no elements in this queue.
		  ///
		  
		  Return If(mElements.Count = 0, True, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652066726F6E7420656C656D656E7420696E2074686520717565756520776974686F75742072656D6F76696E672069742E2052616973657320616E204F75744F66426F756E6473457863657074696F6E2069662074686520717565756520697320656D7074792E
		Function Peek() As Variant
		  ///
		  ' Returns the front element in the queue without removing it.
		  '
		  ' - Raises: OutOfBoundsException if the queue is empty.
		  ///
		  
		  Try
		    Return mElements(0)
		  Catch e
		    Raise New OutOfBoundsException("There are no elements in this queue.")
		  End Try
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 546865206974656D7320696E20746869732071756575652E
		Private mElements() As Variant
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
