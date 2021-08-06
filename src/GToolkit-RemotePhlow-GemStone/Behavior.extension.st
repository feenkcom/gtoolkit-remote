Extension { #name : #Behavior }

{ #category : #'*GToolkit-RemotePhlow-Gemstone' }
Behavior >> gtMethodsListRemoteFor: aView [
	<gtView>

	^ aView list
		title: 'Methods List';
		priority: 10;
		items: [ (self methodDictForEnv: 0) values asSortedCollection: [ :a :b | a selector < b selector ] ];
		itemText: [ :method | method selector ]
]

{ #category : #'*GToolkit-RemotePhlow-Gemstone' }
Behavior >> gtSubclasses [
	"A hack to figure out all subclasses since Metaclass3>>_subclasses always answers nil"
	| allClasses result |

	allClasses := Array new.
	System myUserProfile symbolList
		do: [ :dict | allClasses addAll: (dict select: [ :each | each isBehavior ]) ].
	result := allClasses select: [ :each | each isBehavior and: [ each superclass = self ] ].
	^ result
]

{ #category : #'*GToolkit-RemotePhlow-Gemstone' }
Behavior >> gtSubclassesFor: aView [
	<gtView>

	^ aView tree
		title: 'Subclasses';
		priority: 11;
		items: [ self gtSubclasses ];
		itemText: [ :cls | cls name ];
		children: [ :cls | cls gtSubclasses ]
]

{ #category : #'*GToolkit-RemotePhlow-Gemstone' }
Behavior >> gtSuperclassesFor: aView [
	<gtView>

	^ aView list
		title: 'Superclasses';
		priority: 12;
		items: [ self allSuperClasses reversed ];
		itemText: [ :cls | cls name ]
]
