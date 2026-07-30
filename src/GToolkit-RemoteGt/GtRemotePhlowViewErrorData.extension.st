Extension { #name : #GtRemotePhlowViewErrorData }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowViewErrorData >> asDebuggableElement [
	| errorElement |
	errorElement := self isRemoteException
				ifTrue: 
					[| wrapper |
					wrapper := GtRemotePhlowItemExceptionWrapper new
								exceptionDescription: self errorDescription;
								exceptionObject: self errorObject.
					wrapper asDebuggableElement]
				ifFalse: [self errorObject asDebuggableElement].
	errorElement id: GtPhlowExceptionId.
	^errorElement
]
