Class {
	#name : #GtRemotePhlowObjectActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowObjectActionTarget class >> typeLabel [
	^ 'objectAction'
]

{ #category : #converting }
GtRemotePhlowObjectActionTarget >> asLocalPhlowTarget [
	^ GtPhlowObjectActionTarget uniqueInstance
]
