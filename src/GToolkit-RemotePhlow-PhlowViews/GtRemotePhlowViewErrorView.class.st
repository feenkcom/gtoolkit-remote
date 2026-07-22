Class {
	#name : #GtRemotePhlowViewErrorView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowViewErrorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| viewSpecification |

	viewSpecification := GtPhlowViewErrorViewSpecification new
		errorMessage: self errorMessage;
		dataTransport: GtPhlowViewSpecification dataIncluded.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #accessing }
GtRemotePhlowViewErrorView >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtRemotePhlowViewErrorView >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]
