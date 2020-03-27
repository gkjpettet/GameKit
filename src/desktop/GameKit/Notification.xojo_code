#tag Class
Protected Class Notification
	#tag Method, Flags = &h0
		Sub Constructor(sender As Variant, eventType As GameKit.Events)
		  Self.Sender = sender
		  Self.EventType = eventType
		  Self.Data = New Dictionary
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 4F7074696F6E616C20646174612072656C6174696E6720746F2074686973206E6F74696669636174696F6E2E
		Data As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652074797065206F66206E6F74696669636174696F6E2E
		EventType As GameKit.Events = GameKit.Events.None
	#tag EndProperty

	#tag Property, Flags = &h0
		Sender As Variant
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
			Name="EventType"
			Visible=false
			Group="Behavior"
			InitialValue="GameKit.Events.None"
			Type="GameKit.Events"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - CameraDidMove"
				"2 - CameraViewportDidResize"
				"3 - TileDidChange"
				"4 - TileDidRender"
				"5 - TileMapAnchorDidChange"
				"6 - TileMapAppearanceDidChange"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
