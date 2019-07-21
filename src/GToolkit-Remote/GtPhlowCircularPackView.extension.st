Extension { #name : #GtPhlowCircularPackView }

{ #category : #'*GToolkit-Remote' }
GtPhlowCircularPackView >> asGtDeclarativeView [
	^ GtDeclarativeCircularPackView new 
		title: self title;
		priority: self priority;
		circleData: circleDataBuilder value;
		dataTransport: GtDeclarativeView dataIncluded.
]
