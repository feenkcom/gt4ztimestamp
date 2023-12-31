Extension { #name : #ZSubTimezone }

{ #category : #'*GToolkit4ZTimestamp' }
ZSubTimezone >> gtViewDetailsIn: composite [
	<gtView>
	^ composite columnedList
		title: 'Details';
		items: [ {('abbreviation' -> self abbreviation).
			('offset' -> self offset).
			('daylight saving' -> self isDaylightSaving) } ];
		column: 'Key' text: #key;
		column: 'Value' text: #value;
		send: #value
]
