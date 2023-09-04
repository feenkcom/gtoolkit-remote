Class {
	#name : #GtRemotePhlowThemeIconNameColumn,
	#superclass : #GtRemotePhlowIconNameColumn,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowThemeIconNameColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType iconName
]
