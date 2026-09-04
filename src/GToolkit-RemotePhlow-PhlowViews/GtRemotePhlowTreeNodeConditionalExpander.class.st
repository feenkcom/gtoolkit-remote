Class {
	#name : #GtRemotePhlowTreeNodeConditionalExpander,
	#superclass : #GtRemotePhlowTreeNodeExpander,
	#instVars : [
		'condition'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTreeNodeConditionalExpander >> asDictionaryForExport [
	| specificationData |
	
	specificationData := super asDictionaryForExport.
	specificationData at: 'condition' put: self conditionString.
			
	^ specificationData
]

{ #category : #accessing }
GtRemotePhlowTreeNodeConditionalExpander >> condition [
	^ condition
]

{ #category : #accessing }
GtRemotePhlowTreeNodeConditionalExpander >> condition: aBlock [
	"The block receives [ :aTreeNode :aNodeValue | ... ]"
	condition := aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeNodeConditionalExpander >> conditionString [
	^ self
			gtDo: [ condition printString ]
			gemstoneDo: [ condition method _sourceStringForBlock  ]
]

{ #category : #'api - configuration' }
GtRemotePhlowTreeNodeConditionalExpander >> configurePhlowView: aPhlowView [
	
	aPhlowView expandSuchThat: [ :aTreeNode :aPhlowNode | 
		 aPhlowNode hasChildNodesData ] 
]

{ #category : #'api - configuration' }
GtRemotePhlowTreeNodeConditionalExpander >> expandNode: aNode fromDataSource: aTreeDataSource [
	aNode 
		expandSuchThat: self condition
		withDataSource: aTreeDataSource
]

{ #category : #initialization }
GtRemotePhlowTreeNodeConditionalExpander >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	aDictionary
		at: 'condition'
		ifPresent: [ :aClosureString | 
			self
				condition: (self
						gtDo: [ BlockClosure compiler evaluate: aClosureString ]
						gemstoneDo: [ | bindings receiver |
							bindings := GsCurrentSession currentSession symbolList.
							receiver := self.
							aClosureString _compileInContext: receiver symbolList: bindings ]) ]
]
