!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:26'!
test01

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: ''.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:31'!
test02

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@3 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:34'!
test03

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 1@1 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:38'!
test04

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:45'!
test05

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #West)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:50'!
test06

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: #North) ]! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:54'!
test07

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'ff'.
	
	self assert: (marsRover isAt: 1@4 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:23:59'!
test08

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 2@2 heading: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:06'!
test09

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@2 heading: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:12'!
test10

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:20'!
test11

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:25'!
test12

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 1@1 heading: #West)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:29'!
test13

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:33'!
test14

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 0@2 heading: #North)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:24:37'!
test15

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 13:17:50'!
initializeAt: aPosition heading: aMarsRoverHeading

	position := aPosition.
	heading := aMarsRoverHeading! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:25:05'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ heading cardinalPoint = aCardinalPoint ]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:29:11'!
processCommand: aCommand

	aCommand = $f ifTrue: [ ^ position := position + heading forwardPoint ].
	aCommand = $b ifTrue: [ ^ position := position + heading backwardPoint ].
	aCommand = $r ifTrue: [ ^ heading := heading rightCardinalPoint new].
	aCommand = $l ifTrue: [ ^ heading := heading leftCardinalPoint new].

	self signalInvalidCommand.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 13:17:29'!
at: aPosition heading: aCardinalPoint
	
	| newHeading |

	aCardinalPoint = #North ifTrue: [ newHeading := MarsRoverHeadingNorth new ].
	aCardinalPoint = #East ifTrue: [ newHeading := MarsRoverHeadingEast new ].
	aCardinalPoint = #South ifTrue: [ newHeading := MarsRoverHeadingSouth new].
	aCardinalPoint = #West ifTrue: [ newHeading := MarsRoverHeadingWest new ].

	^self new initializeAt: aPosition heading: newHeading ! !


!classDefinition: #MarsRoverHeadingEast category: #MarsRover!
Object subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:14:51'!
backwardPoint
	
	^-1@0! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:25:32'!
cardinalPoint

	^ #East! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:14:28'!
forwardPoint
	
	^1@0! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:04'!
leftCardinalPoint
	
	^MarsRoverHeadingNorth ! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:34'!
rightCardinalPoint
	
	^MarsRoverHeadingSouth ! !


!classDefinition: #MarsRoverHeadingNorth category: #MarsRover!
Object subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:12:06'!
backwardPoint
	
	^0@-1! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:25:58'!
cardinalPoint

	^ #North! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:11:26'!
forwardPoint
	
	^0@1! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:11'!
leftCardinalPoint
	
	^MarsRoverHeadingWest ! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:42'!
rightCardinalPoint
	
	^MarsRoverHeadingEast ! !


!classDefinition: #MarsRoverHeadingSouth category: #MarsRover!
Object subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:16:58'!
backwardPoint
	
	^0@1! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:25:51'!
cardinalPoint

	^ #South! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:16:42'!
forwardPoint
	
	^0@-1! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:18'!
leftCardinalPoint
	
	^MarsRoverHeadingEast ! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:48'!
rightCardinalPoint
	
	^MarsRoverHeadingWest ! !


!classDefinition: #MarsRoverHeadingWest category: #MarsRover!
Object subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:18:23'!
backwardPoint
	
	^1@0! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:26:08'!
cardinalPoint

	^ #West! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'HAW 6/30/2018 20:18:09'!
forwardPoint
	
	^-1@0! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:24'!
leftCardinalPoint
	
	^MarsRoverHeadingSouth ! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'HAW 7/1/2018 14:28:55'!
rightCardinalPoint
	
	^MarsRoverHeadingNorth ! !
