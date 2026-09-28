Extension { #name : #GtRemotePhlowCopyToClipboardAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowCopyToClipboardAction >> applyOn: aLocalElement [
	GtClipboard clipboardText: clipboardText
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowCopyToClipboardAction >> applyPrimaryModifierOn: aLocalElement [
	self applyOn: aLocalElement
]
