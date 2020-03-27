#tag Class
Protected Class Tile
Inherits GameKit.Node
Implements GameKit.IGraphNode,GameKit.IRenderable
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As graphics, x As Double, y As Double, width As Double, height As Double)
		  ///
		  ' - Raises: UnsupportedOperationException.
		  '
		  ' - Notes: 
		  ' Part of the GameKit.IRenderable interface.
		  ' Must be overridden by subclasses.
		  ///
		  
		  #Pragma Unused g
		  #Pragma Unused x
		  #Pragma Unused y
		  #Pragma Unused width
		  #Pragma Unused height
		  
		  Raise New UnsupportedOperationException(GameKit.Messages.METHOD_MUST_BE_OVERRIDDEN)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F6620746869732074696C652E
		Function ToString() As String
		  /// 
		  ' Returns a String representation of this tile.
		  '
		  ' - Note: Part of the GameKit.IGraphNode interface.
		  ///
		  
		  Return "Tile instance: " + Self.ID.ToString
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520302D626173656420636F6C756D6E207468617420746869732074696C65206F6363757069657320696E20612074696C65206D61702E
		Column As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520302D626173656420726F77207468617420746869732074696C65206F6363757069657320696E20612074696C65206D61702E
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
			Name="Column"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
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
	#tag EndViewBehavior
End Class
#tag EndClass
