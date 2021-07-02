Class {
	#name : #PlpoMetaclass,
	#superclass : #PlpoClassDescription,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoMetaclass class >> remoteClassName [

	^ #Metaclass
]

{ #category : #'accessing - parallel hierarchy' }
PlpoMetaclass >> classSide [
	"Return the metaclass of the couple class/metaclass. Useful to avoid explicit test."
	
	^ self
]

{ #category : #'accessing - parallel hierarchy' }
PlpoMetaclass >> instanceSide [
	"Return the class of the couple class/metaclass. Useful to avoid explicit test."
	
	^ self proxyPerform: #soleInstance
]

{ #category : #testing }
PlpoMetaclass >> isMeta [ 

	^ true
]

{ #category : #listing }
PlpoMetaclass >> visibleMethods [

	^ self methods
]
