Extension { #name : #GtPhlowView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowView >> configureGenericViewSpecificationOn: aViewSpecification [
	aViewSpecification
		title: self title;
		priority: self priority;
		actionSpecifications: (self actions collect: [ :each | each asGtDeclarativeAction ]) asArray
]
