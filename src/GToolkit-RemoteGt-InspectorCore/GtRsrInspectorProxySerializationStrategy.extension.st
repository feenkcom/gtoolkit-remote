Extension { #name : #GtRsrInspectorProxySerializationStrategy }

{ #category : #'*GToolkit-RemoteGt-InspectorCore' }
GtRsrInspectorProxySerializationStrategy >> deserialize: aProxyInspectorData [
	^ GtLocalPhlowViewedObject  
		fromProxy: (aProxyInspectorData at: 'proxyObject')
		withData: (aProxyInspectorData at: 'proxyData')
]
