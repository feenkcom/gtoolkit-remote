Class {
	#name : #GtRemotePhlowRowBuilder,
	#superclass : #GtRemotePhlowNodeValueBuilder,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowRowBuilder >> computeNodeValueForObject: anObject atIndex: aRowIndex [ 
	| phlowColumns columnValues |

	phlowColumns := self phlowView columns.
	columnValues := Array new: phlowColumns size.
	
	phlowColumns withIndexDo: [ :aColumn :aColumnIndex | 
		| computedValue |
	
		computedValue := self withErrorHandlingCompute: [ 
			aColumn 
				computeItemValuesFor: anObject
				rowIndex: aRowIndex
				columnIndex: aColumnIndex ].
	
		columnValues 
			at: aColumnIndex
			put: computedValue ].

	^ GtRemotePhlowRowValue new
		columnValues: columnValues
]
