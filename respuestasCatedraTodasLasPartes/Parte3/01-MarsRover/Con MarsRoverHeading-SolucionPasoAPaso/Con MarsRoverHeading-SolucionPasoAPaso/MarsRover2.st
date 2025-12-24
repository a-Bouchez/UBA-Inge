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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:41:25'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | position := position + (0@1) ]
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:38:27'!
at: aPosition heading: aCardinalPoint
	
	^self new initializeAt: aPosition heading: aCardinalPoint
! !
