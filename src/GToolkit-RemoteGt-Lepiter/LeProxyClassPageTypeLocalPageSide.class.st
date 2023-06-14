Class {
	#name : #LeProxyClassPageTypeLocalPageSide,
	#superclass : #LeProxyClassPageTypePageSide,
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #serialization }
LeProxyClassPageTypeLocalPageSide class >> leJsonV4Name [

	^ 'proxyClassPageTypeLocalPageSide'
]

{ #category : #accessing }
LeProxyClassPageTypeLocalPageSide >> configurePage: aPage forProxyObject: aProxyObject [
	aPage addSnippet: LePharoSnippet new
]

{ #category : #accessing }
LeProxyClassPageTypeLocalPageSide >> id [
	^ 'localSide'
]

{ #category : #accessing }
LeProxyClassPageTypeLocalPageSide >> initialPlaygroundSnippetForProxyObject: aProxyObject [
	^ LePharoSnippet new
]
