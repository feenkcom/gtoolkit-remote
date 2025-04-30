Class {
	#name : #GtProxyCacheSpecifiedSelectorsMatchingCondition,
	#superclass : #GtProxyCacheMatchingCondition,
	#instVars : [
		'includedSelectors',
		'excludedSelectors',
		'excludedPatterns',
		'includedPatterns'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> appliesToMessage: aMessage [
	"Answer a boolean indicating whether the specified message should have its result cached.
	Only included selectors are cached.
	Included regex patterns may be overridden with excluded selectors or patterns."
	| selector |

	selector := aMessage selector.
	((excludedSelectors isNotNil and: [ excludedSelectors includes: selector ]) or:
		[ excludedPatterns isNotNil and: [ excludedPatterns anySatisfy: [ :pattern | selector matchesRegex: pattern ] ] ]) ifTrue:
			[ ^ false ].
	^ (includedSelectors isNotNil and: [ includedSelectors includes: selector ]) or:
		[ includedPatterns isNotNil and: [ includedPatterns anySatisfy: [ :pattern | selector matchesRegex: pattern ] ] ]
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> excludePattern: aRegexString [

	excludedPatterns ifNil: [ excludedPatterns := Set new ].
	excludedPatterns add: aRegexString
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> excludeSelector: aSymbol [

	excludedSelectors ifNil: [ excludedSelectors := Set new ].
	excludedSelectors add: aSymbol
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> excludeSelectors: aCollectionOfSymbols [

	excludedSelectors ifNil: [ excludedSelectors := Set new ].
	excludedSelectors addAll: aCollectionOfSymbols
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> includePattern: aRegexString [

	includedPatterns ifNil: [ includedPatterns := Set new ].
	includedPatterns add: aRegexString
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> includeSelector: aSymbol [

	includedSelectors ifNil: [ includedSelectors := Set new ].
	includedSelectors add: aSymbol
]

{ #category : #'as yet unclassified' }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> includeSelectors: aCollectionOfSymbols [

	includedSelectors ifNil: [ includedSelectors := Set new ].
	includedSelectors addAll: aCollectionOfSymbols
]

{ #category : #initialization }
GtProxyCacheSpecifiedSelectorsMatchingCondition >> initialize [

	super initialize.
	includedSelectors := Set new.
	excludedSelectors := Set new.
	includedPatterns := Set new.
	excludedPatterns := Set new.
]
