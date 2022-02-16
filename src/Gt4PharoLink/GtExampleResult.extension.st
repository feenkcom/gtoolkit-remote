Extension { #name : #GtExampleResult }

{ #category : #'*Gt4PharoLink' }
GtExampleResult >> beSafeSimplifiedExampleResultValue [

	self returnValue: ( [ returnValue asGtSimplifiedExampleResultValue ]
		on: Error
		do: [ :ex |
			GtExampleResultSimplifiedNestedErrorValue new
				description: (String streamContents: [ :stream |
					stream
						print: ex;
						cr;
						<< ex stackString ] ) ] ).
]

{ #category : #'*Gt4PharoLink' }
GtExampleResult >> beSimplifiedExampleResultValue [

	self returnValue: returnValue asGtSimplifiedExampleResultValue
]
