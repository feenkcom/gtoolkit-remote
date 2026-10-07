Extension { #name : #GtRemotePhlowActionTargetTestItem }

{ #category : #'*GToolkit-RemoteGt-Examples' }
GtRemotePhlowActionTargetTestItem >> gtInspectActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtPhlowObjectActionTarget;
		icon: BrGlamorousVectorIcons inspect;
		label: 'Inspect';
		priority: 4;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]
