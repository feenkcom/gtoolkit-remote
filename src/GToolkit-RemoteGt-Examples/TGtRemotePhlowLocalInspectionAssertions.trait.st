Trait {
	#name : #TGtRemotePhlowLocalInspectionAssertions,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #assertions }
TGtRemotePhlowLocalInspectionAssertions >> assertPhlowViewHasErrorWithMessage: aMessageText in: aScripter [
	aScripter checkStep: [ :aStep |
			aStep
				label:'Error element exists';
				exists;
				// GtPhlowExceptionId ].
	aScripter checkStep: [ :aStep |
			aStep
				label: 'Error element has correct message';
				value: [ :anElement | (anElement userData at: #exception) messageText ]
				equals: [ aMessageText ];
				// GtPhlowExceptionId ].
	aScripter checkStep: [:aStep |
			aStep
				label: 'Error label displays message';
				value: [:aButton | (aButton label asString) withoutPrefix: 'Error: ' ]
					equals: [ aMessageText ];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId ].
]

{ #category : #assertions }
TGtRemotePhlowLocalInspectionAssertions >> assertSecondPaneHasLocalMethodWithSelector: aSelector in: aScripter [
	aScripter phlowCompositeToolStep
		onPagerToolInPaneWithIndex: 2;
		assertPhlowToolLabels: {'Method' . 'inspector'}  
			andTypes: {GtMethodDefinitionPhlowTool . GtInspectorTool};
		assertSelectedToolAtIndex: 1 withTabName: 'Method';
		play.
	
	(aScripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [aSelector];
		play.
]
