Class {
	#name : #GtProxyCacheStaticStorage,
	#superclass : #GtProxyCacheStorage,
	#instVars : [
		'cachedResults'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #accessing }
GtProxyCacheStaticStorage >> at: aKey ifAbsentPut: aBlockClosure [
	^ cachedResults at: aKey ifAbsentPut: aBlockClosure
]

{ #category : #initialization }
GtProxyCacheStaticStorage >> initialize [

	super initialize.
	cachedResults := Dictionary new.
]

{ #category : #accessing }
GtProxyCacheStaticStorage >> removeKey: aKey [

	^ cachedResults removeKey: aKey
]

{ #category : #accessing }
GtProxyCacheStaticStorage >> removeKey: aKey ifAbsent: absentBlock [

	^ cachedResults removeKey: aKey ifAbsent: absentBlock
]
