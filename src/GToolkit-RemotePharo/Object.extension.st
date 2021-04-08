Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePharo' }
Object >> gtPharoDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtDeclarativeView
		from: self class
		to: Object) collect: [ :each | each method selector ] as: Set) asArray
]

{ #category : #'*GToolkit-RemotePharo' }
Object >> gtPrintFor: aView [
	<gtDeclarativeView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]
