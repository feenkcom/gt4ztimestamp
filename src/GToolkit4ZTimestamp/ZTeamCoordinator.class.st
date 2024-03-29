"
I am ZTeamCoordinator, a tool to coordinate team members working in different timezones.

I hold a list of ZTeamCoordinatorMembers, each with a name and timezone.

I have  a GT view that shows the details and differences of each member  with respect to the current timezone of the image.

Try the example

	ZTeamCoordinator feenk

To set the current timezone

	ZTimezone current: (ZTimezone id: #'America/New_York').

"
Class {
	#name : #ZTeamCoordinator,
	#superclass : #Object,
	#instVars : [
		'members',
		'name'
	],
	#category : #GToolkit4ZTimestamp
}

{ #category : #accessing }
ZTeamCoordinator class >> feenk [
	<gtExample>
	| team |
	team := self new.
	team name: 'feenk'.
	self feenkTeamSpecification do: [ :each |
		| member |
		member := ZTeamCoordinatorMember new 
			name: each first; 
			timezone: (ZTimezone id: each second); 
			yourself.
		team addMember: member ].
	^ team
]

{ #category : #accessing }
ZTeamCoordinator class >> feenkTeamSpecification [
	^ #(
	(aliaksei 'Europe/Zurich')
	(alistair 'Europe/Prague')
	(andrei 'Europe/Zurich')
	(don 'America/Chicago')
	(doru 'Europe/Zurich')
	(edward 'America/Toronto')
	(iona 'Europe/Zurich')
	(john 'America/Chicago')
	(juraj 'America/Santiago')
	(manuel 'Europe/Zurich')
	(milton 'America/La_Paz')
	(oscar 'Europe/Zurich')
	(simon 'Europe/London')
	(sven 'Europe/Brussels')
	(veit 'Europe/Berlin')
)
]

{ #category : #accessing }
ZTeamCoordinator >> addMember: member [
	self members add: member
]

{ #category : #accessing }
ZTeamCoordinator >> gtViewMembersFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Members';
		items: (self members sorted: #name ascending);
		column: 'Name' text: [ :each | each name ];
		column: 'Timezone' text: [ :each | each timezone id ];
		column: 'Date' text: [ :each | 
			(ZTimestampFormat fromString: '2001-02-03') 
				timezone: each timezone; 
				format: ZTimestamp now ];
		column: 'Clock' text: [ :each | 
			(ZTimestampFormat fromString: '16:05') 
				timezone: each timezone; 
				format: ZTimestamp now ];
		column: 'Offset' text: [ :each | 
			(ZTimestampFormat fromString: '+00:00') 
				timezone: each timezone; 
				format: ZTimestamp now ];
		column: 'Difference' text: [ :each | 
			| difference |
			difference := (each timezone offsetForTimestamp: ZTimestamp now) 
							- (ZTimezone current offsetForTimestamp: ZTimestamp now).
			difference isZero 
				ifTrue: [ 0 ]
				ifFalse: [ difference humanReadablePrintString ] ];
		actionUpdateButton
]

{ #category : #accessing }
ZTeamCoordinator >> members [
	^ members ifNil: [ members := OrderedCollection new ]
]

{ #category : #accessing }
ZTeamCoordinator >> name [
	^ name
]

{ #category : #accessing }
ZTeamCoordinator >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ZTeamCoordinator >> printOn: stream [
	super printOn: stream.
	self name ifNotNil: [
		stream nextPut: $(; print: self name; nextPut: $) ]
]
