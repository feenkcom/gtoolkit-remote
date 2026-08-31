Extension { #name : #GtRemotePhlowNavigationUpdateViewAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowNavigationUpdateViewAction >> applyOn: aLocalElement [ 
	"The current implementation issues the update request and relies on the view
	clearning all the needed caches before updating (GtPhlowElementContext>>#syncUpdate). 
	
	A diffent implementation could be to use the phloe context to locate the view and the
	specification and clearning the specification cache. That would just have to work
	well from all actions where an update could be reuested, like an action from
	the toolbar view, or a context menu action."
	
	aLocalElement phlow fireViewUpdateWish
]
