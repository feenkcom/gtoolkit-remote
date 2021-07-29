Class {
	#name : #GtGemStoneRPackage,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : 'Gtoolkit-RemoteCoder-GemStone'
}

{ #category : #'instance creation' }
GtGemStoneRPackage class >> named: aSymbol [

	^ self new name: aSymbol
]

{ #category : #accessing }
GtGemStoneRPackage >> classes [
	| nameString |

	nameString := name asString.
	^ self gtAllClasses select: [ :each | each _classCategory = nameString ]
]

{ #category : #private }
GtGemStoneRPackage >> gtAllClasses [
	"A hack to figure out all classes"
	| allClasses |

	allClasses := Array new.
	System myUserProfile symbolList
		do: [ :dict | allClasses addAll: (dict select: [ :each | each isBehavior ]) ].
	^ allClasses
]

{ #category : #accessing }
GtGemStoneRPackage >> name [

	^ name
]

{ #category : #accessing }
GtGemStoneRPackage >> name: aSymbol [

	name := aSymbol asSymbol
]
