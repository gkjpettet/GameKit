#tag Module
Protected Module Messages
	#tag Constant, Name = CAMERA_INVALID_VIEWPORT_HEIGHT, Type = String, Dynamic = False, Default = \"The camera\'s viewport height must be greater than or equal to 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_INVALID_VIEWPORT_WIDTH, Type = String, Dynamic = False, Default = \"The camera\'s viewport width must be greater than or equal to 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_NIL, Type = String, Dynamic = False, Default = \"The camera object cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_INVALID_X, Type = String, Dynamic = False, Default = \"The viewport origin X coordinate must be >\x3D 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_INVALID_Y, Type = String, Dynamic = False, Default = \"The viewport origin Y coordinate must be >\x3D 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_NIL, Type = String, Dynamic = False, Default = \"The viewport origin cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_VIEWPORT_NIL, Type = String, Dynamic = False, Default = \"The camera\'s viewport Rect cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ROTATION_INVALID_POINT, Type = String, Dynamic = False, Default = \"The given values do not lie on the unit circle.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GRAPH_INVALID_NODE_ID, Type = String, Dynamic = False, Default = \"There is no GraphNode with the specified ID.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INVALID_UICOMPONENT_DEPTH, Type = String, Dynamic = False, Default = \"A UI component\'s depth must be >\x3D 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_DATA_SOURCE_COLUMN_OUT_OF_BOUNDS, Type = String, Dynamic = False, Default = \"The requested map data source column index is out of bounds.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_DATA_SOURCE_INDEX_NIL, Type = String, Dynamic = False, Default = \"The index passed to a MapDataSource must not be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_DATA_SOURCE_NIL, Type = String, Dynamic = False, Default = \"The map data source cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_DATA_SOURCE_ROW_OUT_OF_BOUNDS, Type = String, Dynamic = False, Default = \"The requested map data source row index is out of bounds.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_INVALID_COLUMN_SIZE, Type = String, Dynamic = False, Default = \"A map must have >\x3D 0 columns.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_INVALID_ROW_SIZE, Type = String, Dynamic = False, Default = \"A map must have >\x3D 0 rows.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_INVALID_TILE_HEIGHT, Type = String, Dynamic = False, Default = \"The height of a tile must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAP_INVALID_TILE_WIDTH, Type = String, Dynamic = False, Default = \"The width of a tile must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = METHOD_MUST_BE_OVERRIDDEN, Type = String, Dynamic = False, Default = \"This method must be overridden by subclasses.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROUTE_FINDER_TRAVELLER_NIL, Type = String, Dynamic = False, Default = \"The RouteFinder must not have a Nil Traveller.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCENE_NODE_IS_NOT_UNIQUE, Type = String, Dynamic = False, Default = \"All nodes within a scene must be unique.", Scope = Protected
	#tag EndConstant


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
