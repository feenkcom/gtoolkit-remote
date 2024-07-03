Class {
	#name : #PlpoGtRemotePhlowSpawnObjectWrapper,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtRemotePhlowSpawnObjectWrapper class >> remoteClassName [ 
	^ #GtRemotePhlowSpawnObjectWrapper
]

{ #category : #accessing }
PlpoGtRemotePhlowSpawnObjectWrapper >> targetObject [
	^ self proxyPerform: #targetObject
]
