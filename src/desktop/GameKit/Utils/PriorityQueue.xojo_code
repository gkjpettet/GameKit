#tag Class
Protected Class PriorityQueue
	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F6620656C656D656E747320696E20746869732071756575652E
		Function Count() As Integer
		  ///
		  ' Returns the number of elements in this queue.
		  ///
		  
		  Return mElements.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616E642072657475726E7320656C656D656E74207769746820746865206C6F77657374207072696F726974792E
		Function Dequeue() As Variant
		  ///
		  ' Removes and returns element with the lowest priority.
		  '
		  ' - Raises: OutOfBoundsException if there are no elements in this queue.
		  ///
		  
		  Var bestIndex As Integer = FindBestIndex
		  
		  Var bestItem As Variant = mElements(bestIndex).Left
		  mElements.Remove(bestIndex)
		  
		  Return bestItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enqueue(element As Variant, priority As Double)
		  mElements.AddRow(element:priority)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732074686520696E646578206F662074686520656C656D656E7420696E2074686973207175657565207769746820746865206C6F77657374207072696F726974792E
		Private Function FindBestIndex() As Integer
		  /// 
		  ' Returns the index of the element in this queue with the lowest priority.
		  '
		  ' - Raises: OutOfBoundsException if there are no elements in the queue.
		  ///
		  
		  // Check for underflow.
		  If mElements.Count = 0 Then
		    Raise New OutOfBoundsException("There are no elements in the queue.")
		  End If
		  
		  Var bestIndex As Integer = 0
		  
		  For i As Integer = 0 To mElements.LastRowIndex
		    If mElements(i).Right.DoubleValue < mElements(bestIndex).Right.DoubleValue Then bestIndex = i
		  Next i
		  
		  Return bestIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746865726520617265206E6F20656C656D656E747320696E20746869732071756575652E
		Function IsEmpty() As Boolean
		  ///
		  ' Returns True if there are no elements in this queue.
		  ///
		  
		  Return If(mElements.Count = 0, True, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652068696768657374207072696F7269747920656C656D656E7420696E2074686520717565756520776974686F75742072656D6F76696E672069742E2052616973657320616E204F75744F66426F756E6473457863657074696F6E2069662074686520717565756520697320656D7074792E
		Function Peek() As Variant
		  ///
		  ' Returns the front element in the queue without removing it.
		  '
		  ' - Raises: OutOfBoundsException if the queue is empty.
		  ///
		  
		  Return mElements(FindBestIndex)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 54686520656C656D656E747320696E207468697320717565756520616E64207468656972206173736F636961746564207072696F726974792073746F726564206173206120506169722061727261792E207B656C656D656E74203A207072696F726974797D2E
		Private mElements() As Pair
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
