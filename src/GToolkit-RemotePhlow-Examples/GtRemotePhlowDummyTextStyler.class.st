Class {
	#name : #GtRemotePhlowDummyTextStyler,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDummyTextStyler >> affectsText [
	^ true
]

{ #category : #accessing }
GtRemotePhlowDummyTextStyler >> style: aText [

	aText glamorousCodeFont.
	(aText from: 12 to: 15) fontSize: 20.
	(aText from: 5 to: 6) highlight: (GtPhlowColor named: #yellow) asColor.
	(aText from: 1 to: 4) bold.
	(aText from: 8 to: 10) foreground: (GtPhlowColor named: #red) asColor.
	(aText from: 12 to: 12) glamorousRegularFont.
	(aText from: 1 to: 6) italic.
	(aText from: 8 to: 15) thin.
	^ aText 
]
