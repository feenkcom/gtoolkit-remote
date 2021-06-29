Class {
	#name : #PlpoCompiledMethod,
	#superclass : #PharoLinkProxyObject,
	#instVars : [
		'selector'
	],
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoCompiledMethod class >> remoteClassName [

	^ #CompiledMethod
]

{ #category : #accessing }
PlpoCompiledMethod >> category [ 

	^ (self proxyPerform: #category) asSymbol
]

{ #category : #ui }
PlpoCompiledMethod >> gtSourceCodeFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Source';
		priority: 10;
		text: [ self sourceCode asRopedText ]
		"styler: StParser gtStyler"
]

{ #category : #testing }
PlpoCompiledMethod >> isCompiledMethod [

	^ true
]

{ #category : #accessing }
PlpoCompiledMethod >> methodClass [ 

	^ self proxyPerform: #methodClass
]

{ #category : #accessing }
PlpoCompiledMethod >> package [

	^ self proxyPerform: #package
]

{ #category : #accessing }
PlpoCompiledMethod >> selector [

	^ selector ifNil: [ selector := (self proxyPerform: #selector) asSymbol ]
]

{ #category : #accessing }
PlpoCompiledMethod >> sourceCode [

	^ self proxyPerform: #sourceCode
]
