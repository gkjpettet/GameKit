#tag Class
Protected Class NavDemoTile
Inherits GameKit.Tile
	#tag Method, Flags = &h0
		Sub Constructor(tileType As NavDemoTile.TileTypes)
		  Super.Constructor
		  
		  Self.Type = tileType
		  
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
		  ' - Notes: 
		  ' Part of the GameKit.IRenderable interface.
		  ' Overrides Tile.Render interface.
		  ///
		  
		  // Draw the fill colour.
		  Select Case Type
		  Case TileTypes.Empty
		    g.DrawingColor = Color.White
		  Case TileTypes.Grass
		    g.DrawingColor = Color.Green
		  Case TileTypes.Mud
		    g.DrawingColor = Color.Brown
		  Case TileTypes.Wall
		    g.DrawingColor = Color.Orange
		  Case TileTypes.Water
		    g.DrawingColor = Color.Blue
		  End Select
		  
		  g.FillRectangle(x, y, width, height)
		  
		  // Draw the border.
		  g.DrawingColor = Color.Black
		  g.DrawRectangle(x, y, width, height)
		  
		  // If this tile is a start or goal marker, render the correct marker.
		  If IsStart Then
		    g.FontSize = height/2
		    g.DrawText("S", x + (width/2 - g.TextWidth("S")/2), y + (height/2 + g.TextHeight/2) - 2)
		  ElseIf IsGoal Then
		    g.FontSize = height/2
		    g.DrawText("G", x + (width/2 - g.TextWidth("G")/2), y + (height/2 + g.TextHeight/2) - 2)
		  End If
		  
		  // Notify observers that this tile has rendered itself.
		  Notify(GameKit.CreateNotification.TileDidRender(Self, Self, g, x, y, width, height))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this tile.
		  ///
		  
		  Return "NavDemoTile instance: " + Self.ID.ToString
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIsGoal
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Prevent the goal and the start being the same tile.
			  If value And Not IsStart Then
			    mIsGoal = value
			  Else
			    mIsGoal = False
			  End If
			  
			End Set
		#tag EndSetter
		IsGoal As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIsStart
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Prevent the goal and the start being the same tile.
			  If value And Not IsGoal Then
			    mIsStart = value
			  Else
			    mIsStart = False
			  End If
			  
			End Set
		#tag EndSetter
		IsStart As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIsGoal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsStart As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As TileTypes = TileTypes.Empty
	#tag EndProperty


	#tag Enum, Name = TileTypes, Type = Integer, Flags = &h0
		Empty
		  Grass
		  Mud
		  Wall
		Water
	#tag EndEnum


	#tag ViewBehavior
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
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue="TileTypes.Empty"
			Type="TileTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Empty"
				"1 - Grass"
				"2 - Mud"
				"3 - Wall"
				"4 - Water"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsGoal"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsStart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
