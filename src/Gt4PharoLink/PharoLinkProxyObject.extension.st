Extension { #name : #PharoLinkProxyObject }

{ #category : #'*Gt4PharoLink' }
PharoLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews |

	self viewProxyDo: [ :remoteInspectorProxy |
		| declarativeData declarativeViewDeclarations |
		declarativeData := remoteInspectorProxy getViewsDeclarations.
		declarativeViewDeclarations := declarativeData at: 'views' ifAbsent: [ #() ].
		rawViews := declarativeViewDeclarations collect: [ :declarativeViewData |
			| declarativeView |
			declarativeView := GtPhlowViewSpecification fromDictionary: declarativeViewData.
			declarativeView
				initializeFromInspector: remoteInspectorProxy.
			declarativeView ] ].

	^ rawViews
]
