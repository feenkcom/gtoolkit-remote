Class {
	#name : #GtRemotePhlowNodeValue,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #printing }
GtRemotePhlowNodeValue >> descriptionOn: aStream [ 
	
]

{ #category : #printing }
GtRemotePhlowNodeValue >> printOn: aStream [ 
	super printOn: aStream .
	
	aStream parenthesize: [
		self descriptionOn: aStream ]
]
