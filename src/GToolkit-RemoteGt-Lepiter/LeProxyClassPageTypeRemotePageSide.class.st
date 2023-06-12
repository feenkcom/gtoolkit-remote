Class {
	#name : #LeProxyClassPageTypeRemotePageSide,
	#superclass : #LeProxyClassPageTypePageSide,
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #serialization }
LeProxyClassPageTypeRemotePageSide class >> leJsonV4Name [

	^ 'proxyClassPageTypeRemotePageSide'
]

{ #category : #accessing }
LeProxyClassPageTypeRemotePageSide >> id [
	^ 'remoteSide'
]

{ #category : #accessing }
LeProxyClassPageTypeRemotePageSide >> isRemoteSide [
	^ true
]
