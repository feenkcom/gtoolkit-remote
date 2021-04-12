Class {
	#name : #FamixStModelProxy,
	#superclass : #PharoLinkProxyObject,
	#instVars : [
		'allModelClasses'
	],
	#category : #'GToolkit-RemoteViews-Moose'
}

{ #category : #accessing }
FamixStModelProxy class >> remoteClassName [

	^ #FamixStModel
]

{ #category : #accessing }
FamixStModelProxy >> allModelClasses [

	^ allModelClasses ifNil: [ allModelClasses := self newCommandFactory
		<< 'self allModelClasses asArray';
		sendAndWait ]
]

{ #category : #ui }
FamixStModelProxy >> gtIncomingViewFor: aView [
	<gtView>
	| view |

	^ aView explicit 
		title: 'Incoming References';
		priority: 20;
		stencil: 
			[ view := GtMondrian new.
			view nodes with: self allModelClasses.
			view edges connectFromAll: #incomingClasses.
			view layout force.
			view ]
]
