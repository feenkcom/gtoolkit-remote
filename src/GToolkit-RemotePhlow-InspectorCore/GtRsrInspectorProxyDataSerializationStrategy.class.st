Class {
	#name : #GtRsrInspectorProxyDataSerializationStrategy,
	#superclass : #GtRsrInspectorProxySerializationStrategy,
	#category : #'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : #accessing }
GtRsrInspectorProxyDataSerializationStrategy class >> strategyLabel [
	^ 'InspectorProxyData'
]

{ #category : #accessing }
GtRsrInspectorProxyDataSerializationStrategy >> deserialize: viewProxyData [
	^ viewProxyData
]
