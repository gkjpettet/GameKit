#tag Module
Protected Module Maths
	#tag Method, Flags = &h1, Description = 52657475726E73206076616C75656020636C616D70656420746F2074686520696E636C75736976652072616E6765206F6620606D696E6020616E6420606D6178602E
		Protected Function Clamp(value As Double, min As Double, max As Double) As Double
		  ///
		  ' Returns `value` clamped to the inclusive range of `min` and `max`.
		  '
		  ' - Parameter value: The value to be clamped.
		  ' - Parameter min: The lower bound of the result.
		  ' - Parameter max: The upper bound of the result.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If value < min Then
		    Return min
		  ElseIf value > max Then
		    Return max
		  Else
		    Return value
		  End If
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1, Description = 5468652076616C7565206F66206E6567617469766520696E66696E6974792E
		#tag Getter
			Get
			  Return -1.0 / 0.0
			End Get
		#tag EndGetter
		Protected NEGATIVE_INFINITY As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 5468652076616C7565206F6620706F73697469766520696E66696E6974792E
		#tag Getter
			Get
			  Return 1.0 / 0.0
			  
			End Get
		#tag EndGetter
		Protected POSITIVE_INFINITY As Double
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
	#tag EndViewBehavior
End Module
#tag EndModule
