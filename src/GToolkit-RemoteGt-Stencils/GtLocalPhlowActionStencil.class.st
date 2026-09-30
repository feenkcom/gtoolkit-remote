Class {
	#name : #GtLocalPhlowActionStencil,
	#superclass : #GtLocalPhlowWithDataStencil,
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #building }
GtLocalPhlowActionStencil >> actionSpecification [
	 ^ GtPhlowActionSpecification 
				phlowActionFromDictionary:  self stencilData
]

{ #category : #building }
GtLocalPhlowActionStencil >> create [
	| anElement |
	(self actionSpecification actionFor: GtPhlowAction noAction)
		asElement: [ :x | anElement := x ]
		withHostElement: nil.
	^ anElement ifNil: [ BlElement new ]
]
