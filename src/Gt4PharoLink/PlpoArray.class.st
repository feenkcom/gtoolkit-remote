Class {
	#name : #PlpoArray,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoArray class >> remoteClassName [

	^ #Array
]

{ #category : #accessing }
PlpoArray >> size [
	^ self proxyPerform: #size
]
