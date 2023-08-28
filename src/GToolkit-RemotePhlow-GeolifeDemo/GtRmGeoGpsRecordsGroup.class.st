Class {
	#name : #GtRmGeoGpsRecordsGroup,
	#superclass : #GtRmGeoGpsGroup,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #'gt - extensions' }
GtRmGeoGpsRecordsGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Records';
		items: [ self items ];
		column: 'Timestamp' text: [ :aRecord | aRecord timestamp ];
		column: 'Latitude' text: [ :aRecord | aRecord latitude ];
		column: 'Longitude' text: [ :aRecord | aRecord longitude ]
]
