#tag Window
Begin Window WinNavigationTest
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   672
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   658644991
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "NavigationTest"
   Type            =   0
   Visible         =   True
   Width           =   944
   Begin NavigationCanvas MyMap
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   600
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TileHeight      =   0.0
      TileWidth       =   0.0
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer CanvasUpdater
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   33
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label LabelCurrentTile
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   640
      Transparent     =   False
      Underline       =   False
      Value           =   "No tile"
      Visible         =   True
      Width           =   70
   End
   Begin GroupBox GroupBoxMode
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Mode"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   173
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   270
      Begin RadioButton ModeRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   " Layout"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   0
         InitialParent   =   "GroupBoxMode"
         Italic          =   False
         Left            =   674
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin RadioButton ModeRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   " Place Start"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   1
         InitialParent   =   "GroupBoxMode"
         Italic          =   False
         Left            =   674
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   88
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   100
      End
      Begin RadioButton ModeRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   " Place Goal"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   2
         InitialParent   =   "GroupBoxMode"
         Italic          =   False
         Left            =   674
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   120
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin RadioButton ModeRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   " Live Route Finding"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   3
         InitialParent   =   "GroupBoxMode"
         Italic          =   False
         Left            =   674
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   165
      End
   End
   Begin PopupMenu PopupMenuLayoutTool
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Empty (cost 1)\nGrass (cost 2)\nMud (cost 3)\nWall (impassable)\nWater (cost 4)"
      Italic          =   False
      Left            =   654
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   269
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   159
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   237
      Transparent     =   False
      Underline       =   False
      Value           =   "Layout Tool:"
      Visible         =   True
      Width           =   88
   End
   Begin Label LabelRouteDetails
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   475
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   640
      Transparent     =   False
      Underline       =   False
      Value           =   "No Route"
      Visible         =   True
      Width           =   449
   End
   Begin CheckBox CheckBoxLiveRouteFinding
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   " Live Route Finding"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   205
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   159
   End
   Begin Label LabelHelp
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   99
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   301
      Transparent     =   False
      Underline       =   False
      Value           =   "When in layout mode you can place tiles with the left mouse button. Choose a tile type from the popup menu above. You can remove tiles with the right mouse button. The movement cost of each tile type is displayed in brackets after the tile type name."
      Visible         =   True
      Width           =   270
   End
   Begin PushButton ButtonClearMap
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Clear Map"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   412
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Set the viewport size of the map to match the Canvas width and height.
		  MyMap.Map.Camera.ResizeViewport(MyMap.Width, MyMap.Height)
		  
		  // Set a constraint on the map camera so it doesn't scroll past the edges.
		  MyMap.Map.AllowOverScrolling = False
		  
		  MyTraveller = New NavDemoTraveller
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  HandleResizing
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  HandleResizing
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ClearRoute()
		  ///
		  ' Tells every tile in CurrentRoute to redraw after emptying out CurrentRoute.
		  ' This will remove the route highlight overlaid on the tiles.
		  ///
		  
		  If CurrentRoute = Nil Then Return
		  
		  Var t As NavDemoTile
		  Var steps() As GameKit.IGraphNode = CurrentRoute.Steps
		  For i As Integer = steps.LastRowIndex DownTo 0
		    t = NavDemoTile(steps.Pop)
		    MyMap.TileData.DidModifyTileAtIndex(t.Row, t.Column)
		  Next i
		  CurrentRoute = Nil
		  
		  // Update the route details at the bottom of the window.
		  UpdateRouteDetails
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320612070617468206265747765656E2074686520737461727420616E6420676F616C20696E64657865732E
		Private Sub FindRoute()
		  ///
		  ' Finds a route between the start and goal indexes.
		  ///
		  
		  If StartIndex = Nil Or GoalIndex = Nil Then Return
		  
		  // Get the start and goal tiles from the map's data source. Remember, these
		  // are also valid GraphNodes as they implement GameKit.IGraphNode.
		  Var start As NavDemoTile = NavDemoTile(MyMap.TileData.Get(StartIndex))
		  Var goal As NavDemoTile = NavDemoTile(MyMap.TileData.Get(GoalIndex))
		  
		  // Clear any existing route so remove the highlighting from the tiles.
		  ClearRoute
		  
		  // Compute a new route. Will be Nil if one can't be found.
		  CurrentRoute = GameKit.RouteFinder.FindRoute(MyMap.Map, start, goal, MyTraveller)
		  
		  // Draw a highlight around the tiles in the route.
		  RedrawRoute
		  
		  // Update the route information at the bottom of the window.
		  UpdateRouteDetails
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C6C6564207768656E65766572207468652077696E646F7720697320726573697A65642E
		Private Sub HandleResizing()
		  ///
		  ' Called whenever the window is resized.
		  ///
		  
		  // Update the size of the map's camera's viewport to match the new size of the canvas
		  // unless the canvas exceeds the size of the map in which case we will constrain the 
		  // viewport to the size of the map.
		  MyMap.Map.Camera.ResizeViewport(Gamekit.Maths.Clamp(MyMap.Width, 1, MyMap.Map.Width), _
		  GameKit.Maths.Clamp(MyMap.Height, 1, MyMap.Map.Height))
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RandomColor() As Color
		  Var r As Integer = System.Random.InRange(0, 255)
		  Var g As Integer = System.Random.InRange(0, 255)
		  Var b As Integer = System.Random.InRange(0, 255)
		  Return RGB(r, g, b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawRoute()
		  ///
		  ' Tells every tile in CurrentRoute to redraw itself.
		  ///
		  
		  If CurrentRoute = Nil Then Return
		  
		  Var row, column As Integer
		  For i As Integer = 0 To CurrentRoute.Steps.LastRowIndex
		    row = NavDemoTile(CurrentRoute.Steps(i)).Row
		    column = NavDemoTile(CurrentRoute.Steps(i)).Column
		    MyMap.TileData.DidModifyTileAtIndex(row, column)
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5570646174657320746865206C6162656C206F6E207468652077696E646F7720646973706C6179696E672064657461696C732061626F7574207468652063757272656E7420726F7574652E
		Private Sub UpdateRouteDetails()
		  ///
		  ' Updates the label on the window displaying details about the current route.
		  ///
		  
		  If CurrentRoute = Nil Then
		    LabelRouteDetails.Value = "No Route"
		  Else
		    LabelRouteDetails.Value = "Steps: " + CurrentRoute.Length.ToString + _
		    ", Cost: " + CurrentRoute.Cost.ToString(Locale.Current, "####.#")
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652063757272656E74206D6F757365206D6F64652E2044657465726D696E657320776861742068617070656E73207768656E20746865206D6F75736520627574746F6E20697320636C69636B65642E
		CurrentMode As Modes = Modes.PlacingStart
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 5468652063757272656E7420726F757465206265747765656E20605374617274496E6465786020616E642060476F616C496E646578602E204D6179206265204E696C2E
		Private CurrentRoute As GameKit.Route
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D617020696E646578206F662074686520676F616C20746F2066696E64206120726F75746520746F2E
		GoalIndex As GameKit.GridIndex
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652063757272656E74206D6F6465206F6620746865206D6F75736520706F696E7465722E
		LayoutTool As NavDemoTile.TileTypes = NavDemoTile.TileTypes.Empty
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207768656E6576657220612074696C65206973206368616E6765642C2074686520726F757465206265747765656E20605374617274496E6465786020616E642060476F616C496E6465786020697320726563616C63756C617465642E
		LiveRouteFinding As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDidContextualClick As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 526573706F6E7369626C6520666F7220636F6D707574696E672074686520636F7374206F66206D6F76696E67206265747765656E2074696C6573206F6E20746865206D61702E
		MyTraveller As NavDemoTraveller
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D617020696E646578206F66207468652074696C6520746F207374617274206F757220726F7574652066726F6D2E
		StartIndex As GameKit.GridIndex
	#tag EndProperty


	#tag Enum, Name = Modes, Type = Integer, Flags = &h0
		Layout
		  PlacingStart
		  PlacingGoal
		RouteToMousePosition
	#tag EndEnum


#tag EndWindowCode

#tag Events MyMap
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  mDidContextualClick = IsContextualClick
		  
		  // Return True to enable processing of the MouseUp event.
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // Get the index of the tile clicked.
		  Var index As GameKit.GridIndex
		  index = Me.Map.IndexAtXY(X - Me.Map.Anchor.X, Y - Me.Map.Anchor.Y)
		  
		  If index <> Nil Then
		    If mDidContextualClick Then
		      // Set the tile to empty.
		      NavDemoTile(Me.TileData.Get(index.Row, index.Column)).Type = NavDemoTile.TileTypes.Empty
		      // Tell the data source that we've modified a tile.
		      Me.TileData.DidModifyTileAtIndex(index)
		      // If we are live route finding then find a route now.
		      If LiveRouteFinding Then FindRoute
		    Else
		      Select Case CurrentMode
		      Case Modes.Layout
		        // Change the type of this tile on the correct map to the correct type.
		        NavDemoTile(Me.TileData.Get(index.Row, index.Column)).Type = LayoutTool
		        // Tell the data source that we've modified a tile.
		        Me.TileData.DidModifyTileAtIndex(index)
		        // If we are live route finding then find a route now.
		        If LiveRouteFinding Then FindRoute
		        
		      Case Modes.PlacingGoal
		        // The user has clicked on the tile they want to be the route goal.
		        If GoalIndex = index Then
		          Return // Nothing has changed.
		        Else
		          // Remove the goal marker from the old goal tile.
		          If GoalIndex <> Nil Then
		            NavDemoTile(Me.Map.TileData.Get(GoalIndex)).IsGoal = False
		            Me.Map.TileData.DidModifyTileAtIndex(GoalIndex)
		          End If
		          // Tell the map's data source that the tile clicked is now the goal.
		          NavDemoTile(Me.Map.TileData.Get(index)).IsGoal = True
		          Me.Map.TileData.DidModifyTileAtIndex(index)
		          // Update the goal index to the tile that has been clicked.
		          GoalIndex = index.Clone
		          // Find a route.
		          FindRoute
		        End If
		        
		      Case Modes.PlacingStart
		        // The user has clicked on the tile they want to be the route start.
		        If StartIndex = index Then
		          Return // Nothing has changed.
		        Else
		          // Remove the start marker from the old start tile.
		          If StartIndex <> Nil Then
		            NavDemoTile(Me.Map.TileData.Get(StartIndex)).IsStart = False
		            Me.Map.TileData.DidModifyTileAtIndex(StartIndex)
		          End If
		          // Tell the tile data source that the tile clicked is now the starting position.
		          NavDemoTile(Me.Map.TileData.Get(index)).IsStart = True
		          Me.Map.TileData.DidModifyTileAtIndex(index)
		          // Update the start index to the tile that has been clicked.
		          StartIndex = index.Clone
		          // Find a route.
		          FindRoute
		        End If
		      End Select
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  // The mouse has moved whilst over the tile map canvas.
		  
		  // Get the grid index of the tile under the mouse. It'll be Nil if there isn't one.
		  Var index As GameKit.GridIndex
		  index = Me.Map.IndexAtXY(X - Me.Map.Anchor.X, Y - Me.Map.Anchor.Y)
		  
		  If index <> Nil Then
		    LabelCurrentTile.Value = "(" + index.Row.ToString + ", " + index.Column.ToString + ")"
		    
		    // Are we live route finding?
		    If CurrentMode = Modes.RouteToMousePosition Then
		      // Tell the tile at the existing goal index that it is no longer the goal.
		      If GoalIndex <> Nil Then
		        NavDemoTile(MyMap.TileData.Get(GoalIndex)).IsGoal = False
		      End If
		      
		      // Update the goal index to the tile the mouse is hovering over.
		      GoalIndex = index
		      
		      // Tell the map's data source that the tile we are hovering over is the new goal.
		      NavDemoTile(MyMap.TileData.Get(index)).IsGoal = True
		      
		      // Compute the new route.
		      FindRoute
		    End If
		    
		  Else
		    LabelCurrentTile.Value = "No tile"
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  LabelCurrentTile.Value = "No tile"
		End Sub
	#tag EndEvent
	#tag Event , Description = 4669726564207768656E6576657220612074696C652072656E6465727320697473656C6620746F20746869732043616E7661732E
		Sub TileDidRender(t As GameKit.Tile, g As Graphics, x As Double, y As Double, width As Double, height As Double)
		  ///
		  ' Called whenever a tile has been rendered.
		  ///
		  
		  // If this tile is in CurrentRoute then highlight it.
		  If CurrentRoute <> Nil Then
		    If CurrentRoute.Steps.IndexOf(t) <> -1 Then
		      g.DrawingColor = Color.Red
		      g.DrawRectangle(x+1, y+1, width-2, height-2)
		      g.DrawRectangle(x+2, y+2, width-4, height-4)
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // Scroll the map.
		  
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  Me.TranslateMapCamera(deltaX, deltaY)
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CanvasUpdater
	#tag Event
		Sub Action()
		  MyMap.Update
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ModeRadioButton
	#tag Event
		Sub Action(index as Integer)
		  Const RADIO_LAYOUT = 0
		  Const RADIO_PLACE_START = 1
		  Const RADIO_PLACE_GOAL = 2
		  Const RADIO_LIVE_ROUTE_FINDING = 3
		  
		  Select Case index
		  Case 0
		    // Layout.
		    CurrentMode = Modes.Layout
		  Case 1
		    // Place start.
		    CurrentMode = Modes.PlacingStart
		  Case 2
		    // Place goal.
		    CurrentMode = Modes.PlacingGoal
		  Case 3
		    // Enable live route finding.
		    LiveRouteFinding = True
		    CheckBoxLiveRouteFinding.Enabled = False
		    CheckBoxLiveRouteFinding.Value = True
		    
		    // Find a route to the mouse position.
		    CurrentMode = Modes.RouteToMousePosition
		    
		    // Remove the current goal marker (if there is one).
		    If GoalIndex <> Nil Then
		      Var t As NavDemoTile = NavDemoTile(MyMap.TileData.Get(GoalIndex))
		      If t <> Nil Then
		        t.IsGoal = False
		        MyMap.TileData.DidModifyTileAtIndex(GoalIndex)
		      End If
		      GoalIndex = Nil
		    End If
		    
		    // Clear the existing route.
		    ClearRoute
		  End Select
		  
		  // Make sure the layout tool popup menu is enabled correctly.
		  If index = RADIO_LAYOUT Then
		    PopupMenuLayoutTool.Enabled = True
		  Else
		    PopupMenuLayoutTool.Enabled = False
		  End If
		  
		  // Make sure the live route finding checkbox is enabled correctly.
		  If index = RADIO_LIVE_ROUTE_FINDING Then
		    CheckBoxLiveRouteFinding.Enabled = False
		    CheckBoxLiveRouteFinding.Value = True
		  Else
		    CheckBoxLiveRouteFinding.Enabled = True
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenuLayoutTool
	#tag Event
		Sub Change()
		  If Me.SelectedRowValue.BeginsWith("Empty") Then
		    LayoutTool = NavDemoTile.TileTypes.Empty
		  ElseIf Me.SelectedRowValue.BeginsWith("Grass") Then
		    LayoutTool = NavDemoTile.TileTypes.Grass
		  ElseIf Me.SelectedRowValue.BeginsWith("Mud") Then
		    LayoutTool = NavDemoTile.TileTypes.Mud
		  ElseIf Me.SelectedRowValue.BeginsWith("Wall") Then
		    LayoutTool = NavDemoTile.TileTypes.Wall
		  ElseIf Me.SelectedRowValue.BeginsWith("Water") Then
		    LayoutTool = NavDemoTile.TileTypes.Water
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxLiveRouteFinding
	#tag Event
		Sub Action()
		  LiveRouteFinding = Me.Value
		  If LiveRouteFinding Then
		    FindRoute
		  Else
		    ClearRoute
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonClearMap
	#tag Event
		Sub Action()
		  // Clear the map and the current route.
		  
		  // Set every tile to be empty.
		  For c As Integer = 0 To MyMap.TileData.NumberOfColumns - 1
		    For r As Integer = 0 To MyMap.TileData.NumberOfRows - 1
		      NavDemoTile(MyMap.TileData.Get(r, c)).Type = NavDemoTile.TileTypes.Empty
		    Next r
		  Next c
		  
		  // Clear the route start and goal markers.
		  If GoalIndex <> Nil Then
		    NavDemoTile(MyMap.TileData.Get(GoalIndex.Row, GoalIndex.Column)).IsGoal = False
		  End If
		  If StartIndex <> Nil Then
		    NavDemoTile(MyMap.TileData.Get(StartIndex.Row, StartIndex.Column)).IsStart = False
		  End If
		  
		  // Clear the route.
		  CurrentRoute = Nil
		  
		  // Force a map redraw.
		  MyMap.Map.ForceRedraw
		  MyMap.Invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentMode"
		Visible=false
		Group="Behavior"
		InitialValue="Modes.Layout"
		Type="Modes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Layout"
			"1 - PlacingStart"
			"2 - PlacingGoal"
			"3 - RouteToMousePosition"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutTool"
		Visible=false
		Group="Behavior"
		InitialValue="NavDemoTile.TileTypes.Empty"
		Type="NavDemoTile.TileTypes"
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
		Name="LiveRouteFinding"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
