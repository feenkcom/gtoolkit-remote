Class {
	#name : #GtPhlowIconStencil,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #accessing }
GtPhlowIconStencil >> asElement [ 
	^ self create
]

{ #category : #accessing }
GtPhlowIconStencil >> create [
	^ self subclassResponsibility
]
