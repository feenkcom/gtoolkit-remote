Class {
	#name : 'GtPhlowDeclarativeListingValueComputation',
	#superclass : 'Object',
	#instVars : [
		'valueComputation',
		'valueComputationArguments'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'accessing' }
GtPhlowDeclarativeListingValueComputation >> computation: aComputation arguments: aCollectionOfArguments [

	valueComputation := aComputation.
	valueComputationArguments := aCollectionOfArguments
]

{ #category : 'computing' }
GtPhlowDeclarativeListingValueComputation >> computeValue [
	^ valueComputation
		phlowValue: valueComputationArguments first
		withEnoughArguments: valueComputationArguments
]
