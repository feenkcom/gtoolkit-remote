"
Test the operation of Gt Declarative views in JavaScript.

The examples assume that the server is started manually.

To start the server:

```bash
cd <js directory>
nodejs src/app.js 7005 7006
```

"
Class {
	#name : 'GtRemoteDeclarativeJavaScriptExamples',
	#superclass : 'GtRemoteDeclarativeExamples',
	#category : 'GToolkit-RemoteExamples'
}

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> collectionOfObjectsCommand [
	"Answer the command to retrieve the test inspectable's collectionOfObjects"

	^ 'this.collectionOfObjects'
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> columnedListViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ 'this.getViewDeclaration(''gtViewColumnedList'')'
]

{ #category : 'private' }
GtRemoteDeclarativeJavaScriptExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ #('gtViewList' 'gtViewColumnedList' 'gtViewString' 'gtViewRaw' 'gtViewPrint')
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> listViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ 'this.getViewDeclaration(''gtViewList'')'
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T12:43:49.623Z')
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> methodNamesCommand [
	"Answer the command to retrieve the test inspectable's view method names"

	^ 'this.getGtViewMethodNames()'
]

{ #category : 'private' }
GtRemoteDeclarativeJavaScriptExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ 'a(n) GtDeclarativeTestInspectable'
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> printViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's print view declaration"

	^ 'this.getViewDeclaration(''gtViewPrint'')'
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> remoteObjectCommand [
	"Answer the command to retrieve the test inspectable from the remote"

	^ 
'let GtDTI = require(''../gtoolkit/gtdeclarativetestinspectable'');
var ti = new GtDTI();
ti'
]

{ #category : 'private' }
GtRemoteDeclarativeJavaScriptExamples >> runningServer [
	"Answer a running server"
	<gtExample>
	<after: #stopServer>
	| settings |

	settings := JSLinkApplication defaultSettings.
	settings
		serverProcessClass: LanguageLinkManualProcess;
		serverSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7005);
		clientSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7006).
	server := JSLinkApplication newWith: settings.
	^ server start.

]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> stringCommand [
	"Answer the command to retrieve the test inspectable's string"

	^ 'this.string'
]

{ #category : 'private - commands' }
GtRemoteDeclarativeJavaScriptExamples >> stringViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's string view declaration"

	^ 'this.getViewDeclaration(''gtViewString'')'
]

{ #category : 'private' }
GtRemoteDeclarativeJavaScriptExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ #GtDeclarativeTestInspectable
]
