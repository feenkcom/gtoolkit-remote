Class {
	#name : #GtRemotePhlowCopyToClipboardAction,
	#superclass : #GtRemotePhlowNavigationAction,
	#instVars : [
		'clipboardText'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtRemotePhlowCopyToClipboardAction class >> forString: aString [
	^ self new clipboardText: aString
]

{ #category : #accessing }
GtRemotePhlowCopyToClipboardAction class >> typeLabel [
	^ 'remotePhlowCopyToClipboard'
]

{ #category : #serialization }
GtRemotePhlowCopyToClipboardAction >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'clipboardText' put: clipboardText;
		yourself
]

{ #category : #accessing }
GtRemotePhlowCopyToClipboardAction >> clipboardText [
	^ clipboardText
]

{ #category : #accessing }
GtRemotePhlowCopyToClipboardAction >> clipboardText: newText [
	clipboardText := newText ifNotNil: [ :anObject | anObject asString ]
]

{ #category : #serialization }
GtRemotePhlowCopyToClipboardAction >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	clipboardText := aDictionary at: 'clipboardText'
]
