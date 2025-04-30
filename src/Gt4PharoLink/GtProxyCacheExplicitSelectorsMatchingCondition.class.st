Class {
	#name : #GtProxyCacheExplicitSelectorsMatchingCondition,
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
GtProxyCacheExplicitSelectorsMatchingCondition >> appliesToMessage: aMessage [
	"Excludes have higher priority than includes"
	| selector |

	((excludedSelectors includes: selector) or:
		[ excludedPatterns anyMatch: selector ]) ifTrue:
			[ ^ false ].
	selector := aMessage selector.
	
	^ false
]

{ #category : #'as yet unclassified' }
GtProxyCacheExplicitSelectorsMatchingCondition >> excludePattern: aRegexString [

	excludedPatterns add: aRegexString
]

{ #category : #'as yet unclassified' }
GtProxyCacheExplicitSelectorsMatchingCondition >> excludeSelector: aSymbol [

	excludedSelectors add: aSymbol
]

{ #category : #'as yet unclassified' }
GtProxyCacheExplicitSelectorsMatchingCondition >> includePattern: aRegexString [

	includedPatterns add: aRegexString
]

{ #category : #'as yet unclassified' }
GtProxyCacheExplicitSelectorsMatchingCondition >> includeSelector: aSymbol [

	includedSelectors add: aSymbol
]

{ #category : #initialization }
GtProxyCacheExplicitSelectorsMatchingCondition >> initialize [

	super initialize.
	includedSelectors := Set new.
	excludedSelectors := Set new.
	includedPatterns := Set new.
	excludedPatterns := Set new.
]
