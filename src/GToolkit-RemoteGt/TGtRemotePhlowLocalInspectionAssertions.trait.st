Trait {
	#name : #TGtRemotePhlowLocalInspectionAssertions,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

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
