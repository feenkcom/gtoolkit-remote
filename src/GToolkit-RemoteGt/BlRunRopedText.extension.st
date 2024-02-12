Extension { #name : #BlRunRopedText }

{ #category : #'*GToolkit-RemoteGt' }
BlRunRopedText >> asDictionaryForExport [
	^ self asGtPlowText asDictionaryForExport
]

{ #category : #'*GToolkit-RemoteGt' }
BlRunRopedText >> asGtPlowText [
	^ (GtPhlowRunBasedText new
		forString: self asString)
			attributeRuns: self extractRemotePhlowRuns
]

{ #category : #'*GToolkit-RemoteGt' }
BlRunRopedText >> extractRemotePhlowRuns [
	| rangesByAttributes attributesByRanges  runsGroup |

	rangesByAttributes := Dictionary new.
	self attributeRunsDo: [ :from :to :attrs | 
		attrs do: [ :each | 
			| locations |
			locations := rangesByAttributes 
				at: each ifAbsentPut: [ OrderedCollection new ].
			(locations notEmpty and: [ locations last last + 1 = from ])
				ifTrue: [ 
					locations at: locations size put: (locations last first to: to) ]
				ifFalse: [ locations add: (from to: to) ] ] ].
	
	attributesByRanges := Dictionary new.
	rangesByAttributes keysAndValuesDo:  [ :anAttribute :currentRanges  |
		currentRanges do: [ :aRange |
			| attributes | 
			attributes := attributesByRanges 
				at: aRange ifAbsentPut: [ OrderedCollection new ].
			attributes add: anAttribute ] ].
	
	runsGroup := GtPhlowRunsGroup new.
	attributesByRanges keysAndValuesDo: [ :aRange :currentAttributes | 
		| safeStartIndex safeEndIndex |
		safeStartIndex := aRange first max: 1.
		safeEndIndex := (aRange last min: self size) max: 1.
		runsGroup addRun: (GtPhlowRun  
		 	from: safeStartIndex
		 	to: safeEndIndex
		 	attributes: (currentAttributes 
		 		collect: [ :anAttribute |
		 			anAttribute asGtRemotePhlowTextAttribute ]
		 		as: Array ) )].
				
	^ runsGroup reject: [ :aRunWithAttributes |
		aRunWithAttributes attributes isEmpty ] 
]

{ #category : #'*GToolkit-RemoteGt' }
BlRunRopedText >> extractRemotePhlowRuns3 [
	| runsGroup currentIntervals |

	runsGroup := GtPhlowRunsGroup new.
	
	currentIntervals := self
		gtIntervalsFrom: 1
		to: self size
		ignoring: #().
	[ currentIntervals notEmpty ] whileTrue: [ 
		| currentInterval |
		currentInterval := currentIntervals removeFirst.
		runsGroup addRun: (GtPhlowRun  
		 	from: currentInterval first
		 	to: currentInterval second
		 	attributes: (currentInterval third 
		 		collect: [ :anAttribute |
		 			anAttribute asGtRemotePhlowTextAttribute ]
		 		as: Array ) ).
		 currentIntervals addAll: (self
			gtIntervalsFrom: currentInterval first
			to: currentInterval second
			ignoring: currentInterval third , currentInterval last) ].

	^ runsGroup reject: [ :aRunWithAttributes |
		aRunWithAttributes attributes isEmpty ] 
]

{ #category : #'*GToolkit-RemoteGt' }
BlRunRopedText >> extractRemotePhlowRunsBasic [
	| runsGroup |

	runsGroup := GtPhlowRunsGroup new.
	
	self attributeRunsDo: [ :aStartIndex :anEndIndex :localAttributes | 
		| safeStartIndex safeEndIndex |
		safeStartIndex := aStartIndex max: 1.
		safeEndIndex := (anEndIndex min: self size) max: 1.
		
		runsGroup addRun: (GtPhlowRun  
		 	from: safeStartIndex
		 	to: safeEndIndex
		 	attributes: (localAttributes 
		 		collect: [ :anAttribute |
		 			anAttribute asGtRemotePhlowTextAttribute ]
		 		as: Array ) ) ].

	^ runsGroup reject: [ :aRunWithAttributes |
		aRunWithAttributes attributes isEmpty ] 
]
