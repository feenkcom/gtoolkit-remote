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
LeProxyClassPageTypeRemotePageSide >> configurePage: aPage forProxyObject: aProxyObject [
	aPage addSnippet: aProxyObject gtRemoteSideInitialPlaygroundSnippet
]

{ #category : #accessing }
LeProxyClassPageTypeRemotePageSide >> id [
	^ 'remoteSide'
]

{ #category : #accessing }
LeProxyClassPageTypeRemotePageSide >> initialPlaygroundSnippetForProxyObject: aProxyObject [
	^ aProxyObject gtRemoteSideInitialPlaygroundSnippet
]

{ #category : #accessing }
LeProxyClassPageTypeRemotePageSide >> isRemoteSide [
	^ true
]
