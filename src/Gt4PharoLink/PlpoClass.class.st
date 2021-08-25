Class {
	#name : 'PlpoClass',
	#superclass : 'PlpoClassDescription',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
PlpoClass class >> remoteClassName [

	^ #Class
]

{ #category : 'accessing - parallel hierarchy' }
PlpoClass >> classSide [
	"Return the metaclass of the couple class/metaclass. Useful to avoid explicit test."
	
	^ self proxyPerform: #class
]

{ #category : 'accessing - parallel hierarchy' }
PlpoClass >> instanceSide [
	
	^ self 
]
