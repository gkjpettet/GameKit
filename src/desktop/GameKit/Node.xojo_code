#tag Class
Protected Class Node
Implements GameKit.IObserver,GameKit.ISubject,GameKit.IUnique
	#tag Method, Flags = &h0, Description = 416464732074686520737065636966696564206F6273657276657220606F6020746F206F7572206B6E6F776E206F62736572766572732E
		Sub AddObserver(o As GameKit.IObserver)
		  ///
		  ' Adds the specified observer `o` to our known observers.
		  '
		  ' - Parameter o: The observer to add.
		  '
		  ' - Note: Part of the GameKit.ISubject interface.
		  ///
		  
		  If Not mObservers.HasKey(o) Then mObservers.Value(o) = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  mObservers = New Dictionary
		  mID = New GameKit.UUID
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686973206E6F6465277320756E69717565206964656E746966696572206173206120555549442E
		Function ID() As GameKit.UUID
		  ///
		  ' Returns this node's unique identifier.
		  '
		  ' - Note: Part of the GameKit.IUnique interface.
		  ///
		  
		  Return mID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotificationReceived(notification As GameKit.Notification)
		  ///
		  ' - Notes:
		  ' Part of the GameKit.IObserver interface.
		  ' Notifications that reach this method will do nothing. Subclasses should override this to 
		  ' respond to them.
		  ///
		  
		  #Pragma Unused notification
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E6F746966792065616368206F66206F7572206F62736572766572732061626F75742074686520706173736564206E6F74696669636174696F6E2E
		Sub Notify(notification As GameKit.Notification)
		  ///
		  ' Notify each of our observers about the passed event with the passed data.
		  '
		  ' - Parameter notification: The notification.
		  '
		  ' - Note: Part of the GameKit.ISubject interface.
		  ///
		  
		  For Each entry As DictionaryEntry In mObservers
		    GameKit.IObserver(entry.Key).NotificationReceived(notification)
		  Next entry
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320746865206F6273657276657220606F602066726F6D206F7572206B6E6F776E206F62736572766572732E
		Sub RemoveObserver(o As GameKit.IObserver)
		  ///
		  ' Removes the observer `o` from our known observers.
		  '
		  ' - Parameter o: The observer to remove.
		  '
		  ' - Note: Part of the GameKit.ISubject interface.
		  ///
		  
		  If mObservers.HasKey(o) Then mObservers.Remove(o)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mID As GameKit.UUID
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 486F6C647320616E79206F626A65637473207468617420617265206F6273657276696E6720746869732063616D6572612E205374727563747572653A207B6F6273657276696E67206F626A656374203A20756E757365647D2E
		Private mObservers As Dictionary
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
