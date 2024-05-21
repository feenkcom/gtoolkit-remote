Extension { #name : #IdentitySet }

{ #category : #'*GToolkit-RemoteGt' }
IdentitySet >> identityIncludes: anObject [
	<gtPharoPatch: #Pharo>
	
	^ self includes: anObject
]
