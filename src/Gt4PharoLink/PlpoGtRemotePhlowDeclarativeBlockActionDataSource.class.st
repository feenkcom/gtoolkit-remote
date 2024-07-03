Class {
	#name : #PlpoGtRemotePhlowDeclarativeBlockActionDataSource,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtRemotePhlowDeclarativeBlockActionDataSource class >> remoteClassName [ 
	^ #GtRemotePhlowDeclarativeBlockActionDataSource
]

{ #category : #accessing }
PlpoGtRemotePhlowDeclarativeBlockActionDataSource >> executeRemoteActionWithPhlowResult [

	^ self
		proxyPerformByValue: #executeRemoteActionWithPhlowResult
]
