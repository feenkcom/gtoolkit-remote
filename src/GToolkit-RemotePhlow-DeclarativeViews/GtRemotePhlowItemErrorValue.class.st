"
I am a node modeling an error that happened during the computation
"
Class {
	#name : #GtRemotePhlowItemErrorValue,
	#superclass : #GtRemotePhlowItemTextualValue,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowItemErrorValue class >> valueTypeName [
	^ 'errorValue'
]

{ #category : #accessing }
GtRemotePhlowItemErrorValue >> background [
	^ super background ifNil: [
		"#errorBackgroundColor"
		GtPhlowColor  
			r: 1.0 
			g: 0.4701857282502444 
			b: 0.458455522971652   ]
]

{ #category : #testing }
GtRemotePhlowItemErrorValue >> isErrorItemValue [
	^ true
]
