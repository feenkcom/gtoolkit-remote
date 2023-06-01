Trait {
	#name : #TPlpoGtPhlowTreeViewSpecification,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TPlpoGtPhlowTreeViewSpecification >> retrieveChildrenForNodeAtPath: aNodePath [
	^ self
		proxyPerformSerialized: #retrieveChildrenForNodeAtPath:
		withPrimitiveArguments: { aNodePath }
]

{ #category : #accessing }
TPlpoGtPhlowTreeViewSpecification >> retriveSentItemAtPath: aNodePath [
	^ self
		proxyPerform: #retriveSentItemAtPath:
		withPrimitiveArguments: { aNodePath }
]
