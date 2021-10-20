Class {
	#name : #GtPharoLinkPostMortemStackFrame,
	#superclass : #Object,
	#instVars : [
		'ordinal',
		'displayString',
		'exception',
		'methodName',
		'blockSource'
	],
	#category : #'Gt4PharoLink-Debugger'
}

{ #category : #'private - accessing' }
GtPharoLinkPostMortemStackFrame >> application [

	^ exception application
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> blockSource [

	^ blockSource
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> blockSource: anObject [

	blockSource := anObject
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> displayString [

	^ displayString
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> displayString: anObject [

	displayString := anObject
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> exception [

	^ exception
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> exception: anObject [

	exception := anObject
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> line [

	^ nil
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> methodClassName [
	"Answer the class name of the class containing the receiver's method"
	| separatorIndex superIndex |

	separatorIndex := methodName indexOfSubCollection: '>>'.
	self assert: separatorIndex > 0.

	"If the method belongs to a superclass, answer the superclass"
	(superIndex := methodName indexOf: $() > 0 ifTrue:
		[ ^ methodName copyFrom: superIndex+1 to: (methodName indexOf: $))-1 ].
	^ methodName copyFrom: 1 to: separatorIndex-1.
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> methodName [

	^ methodName
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> methodName: anObject [

	methodName := anObject
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> methodSelectorName [
	"Answer the selector name of the receiver's method"
	| separatorIndex |

	separatorIndex := methodName indexOfSubCollection: '>>'.
	self assert: separatorIndex > 0.

	^ methodName copyFrom: separatorIndex+2 to: methodName size.
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> ordinal [

	^ ordinal
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> ordinal: anObject [

	ordinal := anObject
]

{ #category : #printing }
GtPharoLinkPostMortemStackFrame >> printOn: aStream [

	displayString
		ifNil: [ super printOn: aStream ]
		ifNotNil: [ aStream << displayString ]
]

{ #category : #accessing }
GtPharoLinkPostMortemStackFrame >> sourceText [
	| text selector |

	blockSource ifNotNil: [ ^ blockSource ].

	selector := self methodSelectorName.
	selector = #DoIt ifTrue: [ ^ '<DoIt source unavailable>' ].
	text := [ (self application newCommandFactory
		<< (self methodClassName, ' >> #', selector);
		sendAndWait) sourceCode ]
			on: Error
			do: [ '<unavailable>' ].
	^ text
]
