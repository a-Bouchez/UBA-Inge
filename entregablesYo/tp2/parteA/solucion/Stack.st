!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 00:59:00'!
isEmpty
	^ stack size = 0 .! !

!OOStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:45:02'!
pop
	^ stackStatus pop! !

!OOStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:45:34'!
push: anItem
	stackStatus := NotEmptyStack on: self.
	stack add: anItem.! !

!OOStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:03:13'!
size
	^ stack size ! !

!OOStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:28:56'!
top
	^ stackStatus  top! !


!OOStack methodsFor: 'notEmptyStackActions' stamp: 'Alex 9/23/2025 02:09:35'!
popOfStackWithItems
	"No pudimos sacar este if"
	| poppedItem |
	poppedItem := stack removeLast.
	stack isEmpty ifTrue: [ stackStatus := EmptyStack on: self ].
	^ poppedItem ! !

!OOStack methodsFor: 'notEmptyStackActions' stamp: 'Alex 9/23/2025 01:12:53'!
topOfStackWithItems
	^ stack  last.! !


!OOStack methodsFor: 'initialization' stamp: 'Alex 9/23/2025 01:41:33'!
initialize
	stack  := OrderedCollection  new.
	stackStatus := EmptyStack on: self .! !


!OOStack methodsFor: 'EmptyStackActions' stamp: 'Alex 9/23/2025 01:52:34'!
emptyStackPop
	^self error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'EmptyStackActions' stamp: 'Alex 9/23/2025 01:52:10'!
emptyStackTop
	^self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackState category: #'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: 'relatedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'initialize' stamp: 'Alex 9/23/2025 01:31:59'!
initializeWithStack: aStack
	relatedStack  := aStack .
! !


!StackState methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:32:37'!
pop
	self  subclassResponsibility ! !

!StackState methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:32:21'!
top
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: #'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'initialize instance' stamp: 'Alex 9/23/2025 01:40:07'!
on: aStack
	^self new initializeWithStack:  aStack .! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
StackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 01:46:18'!
pop
	^ relatedStack emptyStackPop ! !

!EmptyStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 02:01:25'!
top 
	^relatedStack emptyStackTop ! !


!classDefinition: #NotEmptyStack category: #'Stack-Exercise'!
StackState subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 02:01:04'!
pop
	^ relatedStack  popOfStackWithItems ! !

!NotEmptyStack methodsFor: 'actions' stamp: 'Alex 9/23/2025 02:02:31'!
top
	^ relatedStack topOfStackWithItems ! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
