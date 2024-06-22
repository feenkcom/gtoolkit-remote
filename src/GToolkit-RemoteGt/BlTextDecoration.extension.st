Extension { #name : #BlTextDecoration }

{ #category : #'*GToolkit-RemoteGt' }
BlTextDecoration >> asGtRemotePhlowTextDecoration [
	^ GtPhlowTextDecoration new 
		color: (GtPhlowColor 
			r: self color red 
			g: self color green 
			b: self color blue 
			alpha: self color alpha);
		thickness: self thickness;
		styleName: self style class constructor;
		typeNames: (self type types collect: [ :aType |
			aType class constructor ]) asSet
]
