#tag Class
Protected Class Camera
Inherits GameKit.Node
	#tag Method, Flags = &h0, Description = 456E73757265732074686174207468652063616D6572612773206F726967696E2072656D61696E73206265747765656E20606D696E6020616E6420606D6178602E
		Sub ConstrainOrigin(min As Point, max As Point)
		  ///
		  ' Ensures that the camera's origin remains between `min` and `max`.
		  '
		  ' - Parameter min: The minimum permitted origin point.
		  ' - Parameter max: The maximum permitted origin point.
		  ///
		  
		  mMinOriginConstraint = min
		  mMaxOriginConstraint = max
		  Call EnforceOriginConstraints
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  '
		  ' Creates the smallest viewport possible (1 x 1) with a (0, 0) origin.
		  ///
		  
		  Super.Constructor
		  
		  mViewport = New Rect(0, 0, 1, 1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772032442063616D65726120776974682074686520737065636966696564206F726967696E20616E642076696577706F72742E
		Sub Constructor(viewportOriginX As Double, viewportOriginY As Double, viewportWidth As Double, viewportHeight As Double)
		  ///
		  ' Creates a new 2D camera with the specified origin and viewport.
		  '
		  ' - Parameter viewportOriginX: The viewport origin X coordinate.
		  ' - Parameter viewportOriginY: The viewport origin Y coordinate.
		  ' - Parameter viewportWidth: The width of the camera's viewport in pixels.
		  ' - Parameter viewportHeight: The height of the camera's viewport in pixels.
		  '
		  ' - Raises: InvalidArgumentException if the viewport height or width are < 1.
		  '
		  ' - Notes:
		  ' The origin coordinates are relative to the top-left corner. (0,0) is the top left.
		  ///
		  
		  Super.Constructor
		  
		  // Validate arguments.
		  If viewportWidth < 1 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf viewportHeight < 1 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mViewport = New Rect(viewportOriginX, viewportOriginY, viewportWidth, viewportHeight)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(viewport As Rect)
		  ///
		  ' Creates a new 2D camera with the specified anchor and viewport.
		  '
		  ' - Parameter viewport: A Rect representing the camera's viewport. Will be cloned.
		  '
		  ' - Raises: InvalidArgumentException if the viewport height or width are < 1.
		  '
		  ' - Notes:
		  ' The viewport origin coordinates are relative to the top-left corner. (0,0) is the top left.
		  ///
		  
		  Super.Constructor
		  
		  // Validate arguments.
		  If viewport = Nil Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_VIEWPORT_NIL)
		  End If
		  If viewport.Width < 1 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf viewport.Height < 1 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mViewport = viewport.Clone
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 456E666F7263657320616E7920636F6E73747261696E747320706C616365642075706F6E20746869732063616D6572612773206F726967696E2E
		Private Sub EnforceOriginConstraints()
		  ///
		  ' Enforces any constraints placed upon this camera's origin.
		  ///
		  
		  If mMinOriginConstraint <> Nil And mMaxOriginConstraint <> Nil Then
		    Var oldX As Double = mViewport.Origin.X
		    Var oldY As Double = mViewport.Origin.Y
		    mViewport.Origin.X = GameKit.Maths.Clamp(oldX, mMinOriginConstraint.X, mMaxOriginConstraint.X)
		    mViewport.Origin.Y = GameKit.Maths.Clamp(oldY, mMinOriginConstraint.Y, mMaxOriginConstraint.Y)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746869732063616D65726127732076696577706F7274206576656E207061727469616C6C7920696E74657273656374732074686520676976656E20526563742E
		Function Intersects(other As REALbasic.Rect) As Boolean
		  ///
		  ' Returns True if this camera's viewport even partially intersects the given Rect.
		  ///
		  
		  // Convert the deprecated REALbasic.Rect to the API 2.0 version.
		  Var r As New Rect(other.Origin.X, other.Origin.Y, other.Width, other.Height)
		  
		  Return mViewport.Intersects(r)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746869732063616D65726127732076696577706F7274206576656E207061727469616C6C7920696E74657273656374732074686520676976656E20526563742E
		Function Intersects(other As Rect) As Boolean
		  ///
		  ' Returns True if this camera's viewport even partially intersects the given Rect.
		  ///
		  
		  Return mViewport.Intersects(other)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616E7920636F6E73747261696E7473206F6E207468652063616D6572612773206D6F76656D656E74732E
		Sub RemoveConstraints()
		  ///
		  ' Removes any constraints on the camera's movements.
		  ///
		  
		  mMinOriginConstraint = Nil
		  mMaxOriginConstraint = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526573697A657320746869732063616D65726127732076696577706F727420776964746820616E64206865696768742E
		Sub ResizeViewport(width As Integer, height As Integer)
		  ///
		  ' Resizes this camera's viewport width and height.
		  '
		  ' - Parameter width: The new width (in pixels). Must be >= 0.
		  ' - Parameter height: The new height (in pixels). Must be >= 0.
		  '
		  ' - Raises: InvalidArgumentException if the width or height are < 0.
		  ///
		  
		  // Validate the arguments.
		  If width < 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf height < 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  // Construct the notification that we will send later before modifying the viewport as 
		  // we need the previous viewport width and height.
		  Var n As GameKit.Notification
		  n = GameKit.CreateNotification.CameraViewportDidResize(Self, mViewport.Width, mViewport.Height)
		  
		  // Adjust the viewport dimensions.
		  mViewport.Width = width
		  mViewport.Height = height
		  
		  // Notify observers that the viewport has resized.
		  Notify(n)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C61746573207468652063616D65726120696E20746865205820646972656374696F6E206279206076616C75656020706978656C732E204120706F736974697665206076616C756560206D6F766573207468652063616D6572612072696768742C2061206E65676174697665206076616C756560206D6F766573206974206C6566742E
		Sub Translate(x As Double, y As Double)
		  ///
		  ' Translates the camera in the specified X, Y direction.
		  '
		  ' - Parameter x: The number of pixels to move the camera in the X direction.
		  '                A positive value moves the camera right, negative moves it left.
		  ' - Parameter y: The number of pixels to move the camera in the Y direction.
		  '                A positive value moves the camera down, negative moves it up.
		  ///
		  
		  // Create the notification to send before we modify the viewport's origin 
		  // so we can pass the original origin.
		  Var n As GameKit.Notification = CreateNotification.CameraDidMove(Self, mViewport.Origin.X, mViewport.Origin.Y)
		  
		  // Modify the origin's X and Y positions
		  mViewport.Origin.X = mViewport.Origin.X + x
		  mViewport.Origin.Y = mViewport.Origin.Y + y
		  
		  // Enforce any origin constraints that may have been imposed.
		  EnforceOriginConstraints
		  
		  // Notify observers that the camera position changed.
		  Notify(n)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 4966206E6F74204E696C207468656E207468697320726570726573656E747320746865206D6178696D756D20706F696E74207468652063616D6572612773206F726967696E2063616E206F63637570792E
		Private mMaxOriginConstraint As Point
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 4966206E6F74204E696C207468656E207468697320726570726573656E747320746865206D696E696D756D20706F696E74207468652063616D6572612773206F726967696E2063616E206F63637570792E
		Private mMinOriginConstraint As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewport As Rect
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 52657475726E732061207265666572656E636520746F20746869732063616D65726127732076696577706F72742E2043617574696F6E207768656E20616C746572696E672E
		#tag Getter
			Get
			  ///
			  ' Returns this camera's viewport as a Rect.
			  '
			  ' - Returns: A reference to this camera's viewport Rect.
			  '
			  ' - Notes:
			  ' Altering the returned property will affect this camera's viewport but
			  ' will **not** raise any notifications.
			  ///
			  
			  Return mViewport
			  
			End Get
		#tag EndGetter
		Viewport As Rect
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
End Class
#tag EndClass
