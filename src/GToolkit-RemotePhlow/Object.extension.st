Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow' }
Object >> gtPharoDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ] as: Set) asArray
]

{ #category : #'*GToolkit-RemotePhlow' }
Object >> gtPrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]
