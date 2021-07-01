Class {
	#name : #PlpoBehavior,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoBehavior class >> remoteClassName [

	^ #Behavior
]

{ #category : #'private - backend access' }
PlpoBehavior >> allClassVarNames [
	"Answer the names of the receiver's and the receiver's ancestor's class variables."

	^ self superclass
		ifNil: [ self classVarNames ]
		ifNotNil: [ :sup | sup allClassVarNames , self classVarNames ]
]

{ #category : #'queries - other' }
PlpoBehavior >> allInstVarNames [
	"Answer an Array of the names of the receiver's instance variables. The 
	Array ordering is the order in which the variables are stored and 
	accessed by the interpreter."

	^ self superclass
		ifNil: [ self instVarNames ]
		ifNotNil: [ :sup | sup allInstVarNames , self instVarNames ]
]

{ #category : #'private - backend access' }
PlpoBehavior >> classVarNames [

	^ self proxyPerform: #classVarNames
]

{ #category : #accessing }
PlpoBehavior >> instVarNames [

	^ self proxyPerform: #instVarNames
]

{ #category : #accessing }
PlpoBehavior >> methods [ 

	^ self newCommandFactory 
		<< 'self methodDict values';
		sendAndWait
]

{ #category : #accessing }
PlpoBehavior >> superclass [

	^ self proxyPerform: #superclass
]
