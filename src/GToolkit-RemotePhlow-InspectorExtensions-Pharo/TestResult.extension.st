Extension { #name : 'TestResult' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
TestResult >> gtResultsFor: aView [
	<gtView>

	self runCount isZero ifTrue: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Results';
		priority: 10;
		items: [ self gtTestResults ];
		column: 'Selector' item: [ :assoc | assoc key class asString, '>>', assoc key selector ];
		column: 'Status' item: [ :assoc | assoc value ] width: 100;
		send: [ :assoc | assoc key ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
TestResult >> gtTestResults [
	"Answer a collection of result -> label associations"

	^ OrderedCollection new
		addAll: (self passed collect: [ :each | each -> #passed ]);
		addAll: (self failures collect: [ :each | each -> #failure ]);
		addAll: (self errors collect: [ :each | each -> #error ]);
		addAll: (self skipped collect: [ :each | each -> #skipped ]);
		yourself
]
