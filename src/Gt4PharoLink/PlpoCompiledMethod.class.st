Class {
	#name : 'PlpoCompiledMethod',
	#superclass : 'PharoLinkProxyObject',
	#instVars : [
		'selector'
	],
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
PlpoCompiledMethod class >> remoteClassName [

	^ #CompiledMethod
]

{ #category : 'accessing' }
PlpoCompiledMethod >> category [ 

	^ (self proxyPerform: #category) asSymbol
]

{ #category : 'testing' }
PlpoCompiledMethod >> isCompiledMethod [

	^ true
]

{ #category : 'accessing' }
PlpoCompiledMethod >> methodClass [ 

	^ self proxyPerform: #methodClass
]

{ #category : 'accessing' }
PlpoCompiledMethod >> package [

	^ self proxyPerform: #package
]

{ #category : 'accessing' }
PlpoCompiledMethod >> selector [

	^ selector ifNil: [ selector := (self proxyPerform: #selector) asSymbol ]
]

{ #category : 'accessing' }
PlpoCompiledMethod >> sourceCode [

	^ self proxyPerform: #sourceCode
]
