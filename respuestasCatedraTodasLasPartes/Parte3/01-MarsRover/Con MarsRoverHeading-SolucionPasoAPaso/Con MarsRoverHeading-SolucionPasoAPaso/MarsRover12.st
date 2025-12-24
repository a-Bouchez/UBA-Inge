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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:50:07'!
test06

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heding: #North) ]! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:52:12'!
test07

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'ff'.
	
	self assert: (marsRover isAt: 1@4 heding: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:52:53'!
test08

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 2@2 heding: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:55:42'!
test09

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@2 heding: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:57:14'!
test10

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heding: #South)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:57:35'!
test11

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heding: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:00:37'!
test12

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 1@1 heding: #West)! !


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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:39:51'!
isAt: aPosition heding: aCardinalPoint

	^position = aPosition and: [ heading = aCardinalPoint ]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:01:11'!
processCommand: aCommand

	heading = #North ifTrue: [
		aCommand = $f ifTrue: [ ^ position := position + (0@1) ].
		aCommand = $b ifTrue: [ ^ position := position + (0@-1) ].
		aCommand = $r ifTrue: [ ^ heading := #East ].
		aCommand = $l ifTrue: [ ^ heading := #West ] ].
	
	heading = #East ifTrue: [
		aCommand = $f ifTrue: [ ^ position := position + (1@0) ].
		aCommand = $b ifTrue: [ ^ position := position + (-1@0) ].
		aCommand = $r ifTrue: [ ^ heading := #South ].
		aCommand = $l ifTrue: [ ^ heading := #North ] ].
	
	heading = #South ifTrue: [
		aCommand = $f ifTrue: [ ^ position := position + (0@-1) ].
		aCommand = $b ifTrue: [ ^ position := position + (0@1) ].
		aCommand = $r ifTrue: [ ^ heading := #West ]].

	self signalInvalidCommand.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:38:27'!
at: aPosition heading: aCardinalPoint
	
	^self new initializeAt: aPosition heading: aCardinalPoint
! !
