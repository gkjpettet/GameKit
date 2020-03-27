#tag Class
Protected Class ColouredSquareTile
Inherits GameKit.Tile
	#tag Method, Flags = &h0
		Sub Constructor(colour As Color)
		  Super.Constructor
		  
		  Self.Colour = colour
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261777320746869732074696C6520746F2074686520706173736564204772617068696373206F626A6563742E
		Sub Render(g As Graphics, x As Double, y As Double, width As Double, height As Double)
		  ///
		  ' Draws this tile to the passed Graphics object.
		  '
		  ' - Parameter g: The Graphics object to draw to.
		  ' - Parameter x: The top left corner X coordinate.
		  ' - Parameter y: The top left corner Y coordinate.
		  ' - Parameter width: The width of the tile in pixels.
		  ' - Parameter height: The height of the tile in pixels.
		  '
		  ' - Note: Overrides Tile.Render interface.
		  ///
		  
		  // Draw the fill colour.
		  g.DrawingColor = Self.Colour
		  g.FillRectangle(x, y, width, height)
		  
		  // Draw the border.
		  g.DrawingColor = Color.Black
		  g.DrawRectangle(x, y, width, height)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this coloured square tile.
		  ///
		  
		  Return "ColouredColouredSquareTile instance: " + Self.ID.ToString
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Colour As Color
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
		#tag ViewProperty
			Name="Colour"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
