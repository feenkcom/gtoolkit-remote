Class {
	#name : #GtRemotePhlowDeclarativeActionsExamples,
	#superclass : #GtRemotePhlowDeclarativeExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #testing }
GtRemotePhlowDeclarativeActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowDeclarativeActionsExamples
]

{ #category : #assertions }
GtRemotePhlowDeclarativeActionsExamples >> assertActionResultForDatasource: actionDatasource [
	| actionResult |
	actionResult := GtRemotePhlowNavigationAction
			navigationActionFromDictionary: actionDatasource executeRemoteActionWithPhlowResult.
	self assert: actionResult targetObject notNil
]

{ #category : #'examples - actions' }
GtRemotePhlowDeclarativeActionsExamples >> buttonActionWithIcon [
	<gtExample>
	| inspectorProxy actionSpeficificationData actionSpecification actionDatasource |
	
	inspectorProxy := self remoteInspectorProxy.
	actionSpeficificationData := inspectorProxy
			getActionSpecificationDataFor: #gtButtonActionWithIconFor:.
	actionSpecification := GtPhlowActionSpecification
			phlowActionFromDictionary: actionSpeficificationData.
			
	self assert: actionSpecification label equals: nil.
	self assert: actionSpecification priority equals: 11.
	self
		assert: actionSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: actionSpecification tooltipText equals: 'Inspect objects'.
	self assert: actionSpecification phlowDataSource equals: nil.
	self
		assert: actionSpecification methodSelector
		equals: #gtButtonActionWithIconFor:.
		
	actionDatasource := inspectorProxy
			getDeclarativeActionDataSourceFor: #gtButtonActionWithIconFor:.
			
	self assertActionResultForDatasource: actionDatasource.
	
	^ actionSpecification
]

{ #category : #'examples - actions' }
GtRemotePhlowDeclarativeActionsExamples >> buttonActionWithIconAndLabel [
	<gtExample>
	| inspectorProxy actionSpeficificationData actionSpecification actionDatasource |
	
	inspectorProxy := self remoteInspectorProxy.
	actionSpeficificationData := inspectorProxy
			getActionSpecificationDataFor: #gtButtonActionWithBothIconAndLabelFor: .
	actionSpecification := GtPhlowActionSpecification
			phlowActionFromDictionary: actionSpeficificationData.
			
	self assert: actionSpecification label equals: 'Inspect'.
	self assert: actionSpecification priority equals: 12.
	self 
		assert: actionSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: actionSpecification tooltipText equals: 'Inspect objects'.
	self assert: actionSpecification phlowDataSource equals: nil.
	self
		assert: actionSpecification methodSelector
		equals: #gtButtonActionWithBothIconAndLabelFor:.
		
	actionDatasource := inspectorProxy
			getDeclarativeActionDataSourceFor: #gtButtonActionWithBothIconAndLabelFor:.
			
	self assertActionResultForDatasource: actionDatasource.
	
	^ actionSpecification
]

{ #category : #'examples - actions' }
GtRemotePhlowDeclarativeActionsExamples >> buttonActionWithLabel [
	<gtExample>
	| inspectorProxy actionSpeficificationData actionSpecification actionDatasource |

	inspectorProxy := self remoteInspectorProxy.
	actionSpeficificationData := inspectorProxy 
		getActionSpecificationDataFor: #gtButtonActionWithLabelFor:.
	actionSpecification := GtPhlowActionSpecification 
		phlowActionFromDictionary: actionSpeficificationData.
	
	self assert: actionSpecification label equals: 'Inspect 1'.
	self assert: actionSpecification priority equals: 10.
	self assert: actionSpecification iconStencil equals: nil.
	self assert: actionSpecification tooltipText equals: 'Inspect objects'.
	self assert: actionSpecification phlowDataSource equals: nil.
	self assert: actionSpecification methodSelector equals: #gtButtonActionWithLabelFor:.
	
	actionDatasource := inspectorProxy 
		getDeclarativeActionDataSourceFor: #gtButtonActionWithLabelFor:.
		
	self assertActionResultForDatasource: actionDatasource.
	
	^ actionSpecification
]
