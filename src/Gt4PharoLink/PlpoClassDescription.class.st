Class {
	#name : #PlpoClassDescription,
	#superclass : #PlpoBehavior,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoClassDescription class >> remoteClassName [

	^ #ClassDescription
]

{ #category : #'accessing - parallel hierarchy' }
PlpoClassDescription >> classSide [
	"Return the metaclass of the couple class/metaclass. Useful to avoid explicit test."
	
	^ self subclassResponsibility
]

{ #category : #accessing }
PlpoClassDescription >> definition [ 

	^ self proxyPerform: #definition
]

{ #category : #accessing }
PlpoClassDescription >> definitionString [ 

	^ self proxyPerform: #definitionString
]

{ #category : #ui }
PlpoClassDescription >> gtDefinitionFor: aView [
	<gtView>
	^ aView textEditor  
		title: 'Definition';
		priority: 1; 
		styler: (BrRBTextStyler new 
				isForWorkspace: true;
				yourself);
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self definitionString asRopedText ].
]

{ #category : #ui }
PlpoClassDescription >> gtMethodsModelFor: aView [

	^ aView explicit
		title: 'Methods' translated;
		priority: 2;
		stencil: [ (GtClassMethodsCoder forClass: self) asElement ]
]

{ #category : #'accessing - parallel hierarchy' }
PlpoClassDescription >> instanceSide [
	
	^ self subclassResponsibility
]

{ #category : #testing }
PlpoClassDescription >> isMeta [ 

	^ false
]

{ #category : #ui }
PlpoClassDescription >> sortedMethods [
	"Answer the methods sorted by instance/class, selector"

	^ (self instanceSide methods sorted: #selector ascending),
		(self classSide methods sorted: #selector ascending)
]
