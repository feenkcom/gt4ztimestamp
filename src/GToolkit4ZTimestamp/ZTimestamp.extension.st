Extension { #name : #ZTimestamp }

{ #category : #'*GToolkit4ZTimestamp' }
ZTimestamp >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ | container |
			container := BlElement new
					layout: BlLinearLayout horizontal;
					padding: (BlInsets all: 5);
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical fitContent ].
			container addChild: (self
						newLabel: (self year printStringPadded: 4)
						withLegend: 'year'
						primary: true).
			container addChild: (self
						newLabel: '-'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self monthIndex printStringPadded: 2)
						withLegend: 'month'
						primary: true).
			container addChild: (self
						newLabel: '-'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self dayOfMonth printStringPadded: 2)
						withLegend: 'day'
						primary: true).
			container addChild: (self
						newLabel: 'T'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self hours printStringPadded: 2)
						withLegend: 'hours'
						primary: true).
			container addChild: (self
						newLabel: ':'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self minutes printStringPadded: 2)
						withLegend: 'minutes'
						primary: true).
			container addChild: (self
						newLabel: ':'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self seconds printStringPadded: 2)
						withLegend: 'seconds'
						primary: true).
			container addChild: (self
						newLabel: '.'
						withLegend: nil
						primary: false).
			container addChild: (self
						newLabel: (self formatNanoseconds: self nanoSecond)
						withLegend: 'nanoseconds'
						primary: false).
			container addChild: (self
						newLabel: 'Z'
						withLegend: nil
						primary: false).
			container ]
]

{ #category : #'*GToolkit4ZTimestamp' }
ZTimestamp >> gtViewDetailsIn: composite [
	<gtView>
	^ composite columnedList
		title: 'Details';
		items: [ {('iso' -> self printString).
			(ZTimezone current id asLowercase -> (ZTimestampFormat isoNanoTZ useCurrentTimezone; format: self)).
			('year' -> self year).
			('month' -> self monthIndex).
			('month name' -> self monthName).
			('day of month' -> self dayOfMonth).
			('day of week' -> self dayOfWeekName).
			('day of year' -> self dayOfYear).
			('hours' -> self hours).
			('minutes' -> self minutes).
			('seconds' -> self seconds).
			('nanoseconds' -> self nanoSecond).
			('offset' -> self offset).
			('date' -> self asDate).
			('time' -> self asTime).
			('unix time' -> self asUnixTime).
			('julian day number' -> self julianDayNumber).
			('nanoseconds since midnight' -> self nanosecondsSinceMidnight) } ];
		column: 'Key' text: #key;
		column: 'Value' text: #value;
		send: #value
]
