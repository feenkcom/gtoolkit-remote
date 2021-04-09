Class {
	#name : #GtRemoteDeclarativeStExamples,
	#superclass : #GtRemoteDeclarativeExamples,
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> collectionOfObjectsCommand [
	"Answer the command to retrieve the test inspectable's collectionOfObjects"

	^ 'self collectionOfObjects'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> columnedListViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ 'self getViewDeclaration: #gtColumnedListFor:'
]

{ #category : #private }
GtRemoteDeclarativeStExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ #(gtStringFor: gtListFor: gtColumnedListFor: gtPrintFor:)
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> listViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ 'self getViewDeclaration: #gtListFor:'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00')
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> methodNamesCommand [
	"Answer the command to retrieve the test inspectable's view method names"

	^ 'self getGtViewMethodNames'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> printViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's print view declaration"

	^ 'self getViewDeclaration: #gtPrintFor:'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> remoteObjectCommand [
	"Answer the command to retrieve the test inspectable from the remote"

	^ self testInspectableName, ' new'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> stringCommand [
	"Answer the command to retrieve the test inspectable's string"

	^ 'self string'
]

{ #category : #'private - commands' }
GtRemoteDeclarativeStExamples >> stringViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's string view declaration"

	^ 'self getViewDeclaration: #gtStringFor:'
]
