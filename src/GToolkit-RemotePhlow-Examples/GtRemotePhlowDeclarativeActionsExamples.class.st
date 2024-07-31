Class {
	#name : #GtRemotePhlowDeclarativeActionsExamples,
	#superclass : #GtRemotePhlowDeclarativeExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - actions' }
GtRemotePhlowDeclarativeActionsExamples >> buttonActionWithLabel [
	<gtExample>
	<after: #stopServer>
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
	"GtRemotePhlowDeclarativeBlockActionDataSource."
	actionDatasource := inspectorProxy 
		getDeclarativeActionDataSourceFor: #gtButtonActionWithLabelFor:.
		
	actionDatasource executeRemoteActionWithPhlowResult.
	
	^ actionSpecification
]

{ #category : #private }
GtRemotePhlowDeclarativeActionsExamples >> getRemoteObject [

	^ GtRemotePhlowDeclarativeTestInspectable new
]
