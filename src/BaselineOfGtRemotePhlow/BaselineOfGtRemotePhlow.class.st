"
Load the server for remote Gt access to a Pharo image.

Note that this package isn't normally loaded in a Gt image, see ${class:name=BaselineOfGToolkitRemote}$.
"
Class {
	#name : #BaselineOfGtRemotePhlow,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtRemotePhlow
}

{ #category : #baseline }
BaselineOfGtRemotePhlow >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'PharoLink' 
					with: [ spec repository: 'github://feenkcom/PharoLink:main/src' ];
				
				package: 'GToolkit-RemotePhlow-DeclarativeViews'; 
				package: 'GToolkit-RemotePhlow-PhlowViews'
					with: [ spec requires: #( #'GToolkit-RemotePhlow-DeclarativeViews' ) ];
				
				package: 'GToolkit-RemotePhlow-InspectorCore' 
					with: [ spec requires: #( PharoLink #'GToolkit-RemotePhlow-PhlowViews' ) ];
				package: 'GToolkit-RemotePhlow-InspectorExtensions-Pharo' 
					with: [ spec requires: #( #'GToolkit-RemotePhlow-InspectorCore'  ) ];
				package: 'GToolkit-RemotePhlow-InspectorExtensions-Remote'
					with: [ spec requires: #( #'GToolkit-RemotePhlow-InspectorCore'  ) ];
				
				package: 'GToolkit-RemotePhlow-Remote'
					with: [ spec requires: #( #'GToolkit-RemotePhlow-InspectorCore' ) ];
				package: 'GToolkit-RemotePhlow-Pharo' 
					with: [ spec requires: #( 'GToolkit-RemotePhlow-InspectorExtensions' ) ];
				package: 'GToolkit-RemotePhlow-Examples' 
					with: [ spec requires: #( 'GToolkit-RemotePhlow-InspectorExtensions' ) ]
		]
]
