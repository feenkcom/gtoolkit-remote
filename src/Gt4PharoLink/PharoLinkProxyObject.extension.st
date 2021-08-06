Extension { #name : 'PharoLinkProxyObject' }

{ #category : '*Gt4PharoLink' }
PharoLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews |

	self viewProxyDo: [ :remoteInspectorProxy |
		| declarativeData declarativeViewDeclarations |
		declarativeData := remoteInspectorProxy getViewsDeclarations.
		declarativeViewDeclarations := declarativeData at: 'views' ifAbsent: [ #() ].
		rawViews := declarativeViewDeclarations collect: [ :declarativeViewData |
			| declarativeView |
			declarativeView := GtPhlowDeclarativeView fromDictionary: declarativeViewData.
			declarativeView
				initializeFromInspector: remoteInspectorProxy.
			declarativeView ] ].

	^ rawViews
]

{ #category : '*Gt4PharoLink' }
PharoLinkProxyObject >> getViewProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self newCommandFactory
		<< 'llCommand gtViewedObjectClass object: self';
		sendAndWait.

]
