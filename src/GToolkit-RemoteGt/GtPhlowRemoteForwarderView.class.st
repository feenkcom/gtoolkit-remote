Class {
	#name : #GtPhlowRemoteForwarderView,
	#superclass : #GtPhlowViewDecorator,
	#traits : 'TGtPhlowSendTransformable',
	#classTraits : 'TGtPhlowSendTransformable classTrait',
	#instVars : [
		'phlowView',
		'viewObject',
		'objectComputation',
		'viewSymbol'
	],
	#category : #'GToolkit-RemoteGt-Phlow'
}

{ #category : #accessing }
GtPhlowRemoteForwarderView class >> contentId [
	^ #'phlow--remote-forwarder-content' asBlocElementId
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> asElementDo: aBlock [
	"it evaluates aBlock if the view should have content"
	| aPromiseElement |
	
	aPromiseElement := BrFromPromise new.
	self beViewElement: aPromiseElement.

	aPromiseElement
		matchParent;
		stencil: [ 
			BrFrame new
				matchParent ];
		dataBinder: [ :aContainer :aData |
			aContainer removeChildren.
			aData
				ifSuccess: [ :aPhlowView |
					aPhlowView asElementDo: [ :anElement |
						[ aContainer addChild: anElement as: self class contentId ]
							on: Error
							do: [ :anException |
								(self phlowErrorViewWithException: anException)
									asElementDo: [ :anErrorElement | aContainer addChild: anErrorElement ] ] ] ]
				ifError: [ :anError | 
					(self phlowErrorViewWithException: anError) 
						asElementDo: [ :anErrorElement | 
							aContainer 
								addChild: anErrorElement 
								as: self class contentId ] ]
				ifPending: [
					| aPendingLabel |
					
					aPendingLabel := BrLabel new
						aptitude: (BrGlamorousLabelAptitude new italic 
							foreground: BrGlamorousColors disabledHeaderTextColor);
						constraintsDo: [ :c | 
							c ignoreByLayout.
							c ignored horizontal alignCenter.
							c ignored vertical alignCenter ];
						text: ''.

					aPendingLabel enqueueTask: (BlDelayedTaskAction new
						delay: 1 second;
						action: [ aPendingLabel text: 'Rendering...' ]). 

					aContainer addChild: aPendingLabel ] ].
	
	aPromiseElement promise: self phlowView.
	
	^ aBlock value: aPromiseElement
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> computeTargetViewForObject: aForwardedObject [
	| computedView |
	computedView := nil.
	
	aForwardedObject viewProxyDo: [ :remoteInspectorProxy |
		| forwarderViewData forwarderSpecification |
		forwarderViewData := remoteInspectorProxy 
			getViewDeclaration: self viewSymbol.
			"getStandaloneViewDeclarationFor: self viewSymbol".
		forwarderSpecification := GtPhlowViewSpecification 
			fromDictionary: forwarderViewData.
		forwarderSpecification initializeFromInspector: remoteInspectorProxy.
				
		computedView := forwarderSpecification viewFor: GtPhlowView empty ].
	
	self hasTransformation
		ifTrue: [ computedView copyTransformationFrom: self transformation ].
		
	^ computedView
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> createPhlowView [

	<return: #TAsyncPromise of: #GtPhlowView>
	^ self viewObject
		then: [ :aForwardedObject | 
			self computeTargetViewForObject: aForwardedObject object ] 
		otherwise: [ :anException |
			phlowView := (self phlowErrorViewWithException: anException) asAsyncPromise.
			phlowView ]
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> defaultTitle [
	^ 'Remote Forwarded'
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> object [
	^ objectComputation
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> object: aComputation [
	objectComputation := aComputation
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> phlowView [
	<return: #TAsyncPromise of: #GtPhlowView>

	^ phlowView ifNil: [ phlowView := self createPhlowView ]
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> secureObjectExecution [
	<return: #TAsyncPromise>

	^ (self object asAsyncFuture map: [ :anObject | GtPhlowForwardedObject new object: anObject ])
		asAsyncPromise
			then: [ :anObject | anObject ]
			otherwise: [ :anException |
				phlowView := (self phlowErrorViewWithException: anException) asAsyncPromise.
				anException asAsyncPromise ]
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> view: aSymbol [
	viewSymbol := aSymbol
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> viewObject [
	<return: #AsyncPromise of: #Object>

	^ viewObject ifNil: [ viewObject := self secureObjectExecution ]
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> viewSymbol [
	^ viewSymbol ifNil: [ #gtLiveFor: ]
]
