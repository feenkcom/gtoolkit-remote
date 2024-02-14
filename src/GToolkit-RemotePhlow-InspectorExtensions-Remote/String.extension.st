Extension { #name : #String }

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
String >> gtStringFor: aView [
	<gtView>

	^ aView text
		title: 'String';
		priority: 9;
		text: [ self ]
]
