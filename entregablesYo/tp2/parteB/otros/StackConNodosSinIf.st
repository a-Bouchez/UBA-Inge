!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackTop stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'LL 9/25/2025 12:43:04'!
initialize
	stackTop := OOStackNilNode new.
	stackSize := 0.! !


!OOStack methodsFor: 'actions' stamp: 'LL 9/25/2025 12:37:11'!
isEmpty
	^stackTop isNilNode.! !

!OOStack methodsFor: 'actions' stamp: 'LL 9/25/2025 12:37:21'!
pop
	|poppedItem|
	
	poppedItem := stackTop nodeValue.
	stackTop := stackTop nextNode.
	stackSize := stackSize - 1.
	
	^poppedItem! !

!OOStack methodsFor: 'actions' stamp: 'LL 9/25/2025 12:45:39'!
push: aValue
	stackTop := OOStackNode withValue: aValue nextNode: stackTop.
	"tiene mas pinta de previous el next pero como no soy una lista enlazada no opino"
	stackSize := stackSize + 1.! !

!OOStack methodsFor: 'actions' stamp: 'LL 9/25/2025 07:50:28'!
size
	^stackSize.! !

!OOStack methodsFor: 'actions' stamp: 'LL 9/25/2025 12:37:53'!
top
	^stackTop nodeValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackNilNode category: #'Stack-Exercise'!
Object subclass: #OOStackNilNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNilNode methodsFor: 'actions' stamp: 'LL 9/25/2025 12:35:48'!
isNilNode
	^true! !

!OOStackNilNode methodsFor: 'actions' stamp: 'LL 9/25/2025 12:35:05'!
nextNode
	^self error: OOStack stackEmptyErrorDescription! !

!OOStackNilNode methodsFor: 'actions' stamp: 'LL 9/25/2025 12:35:24'!
nodeValue
	^self error: OOStack stackEmptyErrorDescription! !



!classDefinition: #OOStackNode category: #'Stack-Exercise'!
Object subclass: #OOStackNode
	instanceVariableNames: 'nodeValue nextNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNode methodsFor: 'initialization' stamp: 'LL 9/25/2025 12:44:39'!
initializeWithValue: aValue nextNode: aNode
	nodeValue := aValue.
	nextNode := aNode.! !


!OOStackNode methodsFor: 'actions' stamp: 'LL 9/25/2025 12:32:41'!
isNilNode
	^false.! !

!OOStackNode methodsFor: 'actions' stamp: 'LL 9/25/2025 07:47:33'!
nextNode
	^ nextNode! !

!OOStackNode methodsFor: 'actions' stamp: 'LL 9/25/2025 07:47:57'!
nodeValue
	^nodeValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNode class' category: #'Stack-Exercise'!
OOStackNode class
	instanceVariableNames: 'data nextNode'!

!OOStackNode class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 07:55:52'!
withValue: aValue nextNode: aNode
	^self new initializeWithValue: aValue nextNode: aNode.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


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
