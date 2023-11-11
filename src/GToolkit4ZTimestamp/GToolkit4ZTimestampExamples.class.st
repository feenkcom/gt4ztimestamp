"
Example for ZTimestamp
"
Class {
	#name : #GToolkit4ZTimestampExamples,
	#superclass : #Object,
	#category : #GToolkit4ZTimestamp
}

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> components [
	<gtExample>
	| now jdn ns |
	now := self now.
	jdn := now julianDayNumber.
	ns := now nanosecondsSinceMidnight.
	self assert: (ZTimestamp new jdn: jdn ns: ns) equals: now.
	^ { jdn . ns }
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> julianDate [
	<gtExample>
	| now jd |
	now := self now.
	jd := now julianDate.
	self assert: jd isFloat.
	self assert: ((ZTimestamp fromJulianDate: jd) - now) abs < 1 milliSecond.
	^ jd
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> mixedArithmetic [
	<gtExample>
	| t1 t2 delta |
	t1 := ZTimestamp fromString: '20231101T100000'.
	t2 := DateAndTime fromString: '2023/10/01 09:00:00'.
	delta := t1 - t2.
	self assert: delta equals: 31 days + 2 hours.
	^ delta
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> now [
	<gtExample>
	^ ZTimestamp now
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> sorting [
	<gtExample>
	| timestamps |
	timestamps := (25 to: 15 by: -1) collect: [ :each |
		self now + each atRandom minutes ].
	timestamps := timestamps sorted.
	self assert: timestamps first equals: timestamps min.
	self assert: timestamps last equals: timestamps max. 
	^ timestamps
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> today [
	<gtExample>
	^ self now asBeginOfDay
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> unixTime [
	<gtExample>
	| now unixTime |
	now := self now.
	unixTime := now asUnixTime.
	self assert: unixTime isInteger.
	self assert: (ZTimestamp fromUnixTime: unixTime) equals: now truncated.
	^ unixTime
]
