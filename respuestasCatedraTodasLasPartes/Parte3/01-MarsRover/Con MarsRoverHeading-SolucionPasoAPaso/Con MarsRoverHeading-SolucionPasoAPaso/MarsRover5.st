!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:37:31'!
test01

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: ''.
	
	self assert: (marsRover isAt: 1@2 heding: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:40:17'!
test02

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@3 heding: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:42:25'!
test03

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 1@1 heding: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:44:26'!
test04

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heding: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:45:32'!
test05

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heding: #West)! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:38:58'!
initializeAt: aPosition heading: aCardinalPoint

	position := aPosition.
	heading := aCardinalPoint ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:39:51'!
isAt: aPosition heding: aCardinalPoint

	^position = aPosition and: [ heading = aCardinalPoint ]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:45:51'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | 
		aCommand = $f ifTrue: [ position := position + (0@1) ].
		aCommand = $b ifTrue: [ position := position + (0@-1) ].
		aCommand = $r ifTrue: [ heading := #East ].
		aCommand = $l ifTrue: [ heading := #West ].
		
		 ]
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:38:27'!
at: aPosition heading: aCardinalPoint
	
	^self new initializeAt: aPosition heading: aCardinalPoint
! !
