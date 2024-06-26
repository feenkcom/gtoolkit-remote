Class {
	#name : #GtRsrInspectorProxySerializationStrategy,
	#superclass : #GtRsrSerializationStrategy,
	#category : #'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : #accessing }
GtRsrInspectorProxySerializationStrategy >> deserialize: viewProxyData [
	^ (viewProxyData at: 'proxyObject')
		initializeFromProxyData: (viewProxyData at: 'proxyData');
		yourself
]
