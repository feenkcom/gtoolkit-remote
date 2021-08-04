Extension { #name : 'PharoLinkProxyObject' }

{ #category : '*Gt4PharoLink' }
PharoLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews |

	rawViews := #().
	self viewProxyDo: [ :remoteInspectorProxy |
		| viewSelectors |
		viewSelectors := remoteInspectorProxy getDeclarativeViewMethodNames.
		rawViews := viewSelectors collect: [ :viewSelector |
			| viewDictionary declarativeView |
			viewDictionary := remoteInspectorProxy getViewDeclaration: viewSelector.
			declarativeView := GtPhlowDeclarativeView fromDictionary: viewDictionary.
			declarativeView
				methodSelector: viewSelector;
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
