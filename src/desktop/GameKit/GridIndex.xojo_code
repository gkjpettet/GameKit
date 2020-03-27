#tag Class
Protected Class GridIndex
Inherits GameKit.Node
	#tag Method, Flags = &h0, Description = 52657475726E73206120636C6F6E65206F66207468697320696E6465782E
		Function Clone() As GameKit.GridIndex
		  ///
		  ' Returns a clone of this index.
		  ///
		  
		  Return New GameKit.GridIndex(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(other As GameKit.GridIndex)
		  Super.Constructor
		  
		  Self.Column = other.Column
		  Self.Row = other.Row
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(row As Integer, column As Integer)
		  Super.Constructor
		  
		  Self.Row = row
		  Self.Column = column
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(other As GameKit.GridIndex) As Integer
		  If other = Nil Then Return - 1
		  
		  If Self.Column = other.Column And Self.Row = other.Row Then
		    Return 0
		  Else
		    Return -1
		  End If
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a (row, column) index in a 2D grid.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520302D626173656420636F6C756D6E2E
		Column As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520302D626173656420726F772E
		Row As Integer = -1
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
			Name="Row"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Column"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
