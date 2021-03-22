Extension { #name : #PBPythonError }

{ #category : #'*Gt4PythonBridge' }
PBPythonError >> gtTraceFor: aView [
	<gtView>

	trace ifNil: [ ^ aView empty ].
	^ aView textEditor
		title: 'Python Trace';
		priority: 5;
		text: [ trace asRopedText ]
]
