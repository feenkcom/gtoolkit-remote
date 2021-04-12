Class {
	#name : #FamixStClassProxy,
	#superclass : #PharoLinkProxyObject,
	#instVars : [
		'className',
		'incomingClasses'
	],
	#category : #'GToolkit-RemoteViews-Moose'
}

{ #category : #accessing }
FamixStClassProxy class >> remoteClassName [

	^ #FamixStClass
]

{ #category : #accessing }
FamixStClassProxy >> className [ 

	^ className ifNil: [ className := self newCommandFactory
		<< 'self name';
		sendAndWait ].
]

{ #category : #accessing }
FamixStClassProxy >> incomingClasses [

	^ incomingClasses ifNil: [ incomingClasses := self newCommandFactory
		<< '(self queryIncomingReferences collect: #source) asArray collect: #parentType';
		sendAndWait ].
]

{ #category : #printing }
FamixStClassProxy >> printOn: aStream [
	"Only print the class name if it has already been retrieved (since retrieving is expensive)"

	aStream
		<< 'FamixStClass: ';
		<< self className
]
