Extension { #name : #LePage }

{ #category : #'*GToolkit-RemoteGt-Lepiter' }
LePage >> initializeProxyClassName: aTargetClassName proxyTypeName: aProxyClassName proxySide: aProxySide [ 

	type := LeProxyClassPageType 
		forPageClassName: aTargetClassName
		proxyTypeName: aProxyClassName
		proxySide: aProxySide
		page: self
]

{ #category : #'*GToolkit-RemoteGt-Lepiter' }
LePage class >> proxyClassName: aSymbol proxyTypeName: aProxyClassName proxySide: aProxySide [

	^ self new 
		initializeProxyClassName: aSymbol 
		proxyTypeName: aProxyClassName
		proxySide: aProxySide 
]
