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
	instanceVariableNames: 'nodeInternalValue nextNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNode methodsFor: 'initialization' stamp: 'Alex 9/25/2025 23:11:56'!
initializeWithValue: aValue nextNode: aNode
	nodeInternalValue := aValue.
	nextNode := aNode.! !


!OOStackNode methodsFor: 'actions' stamp: 'LL 9/25/2025 12:32:41'!
isNilNode
	^false.! !

!OOStackNode methodsFor: 'actions' stamp: 'LL 9/25/2025 07:47:33'!
nextNode
	^ nextNode! !

!OOStackNode methodsFor: 'actions' stamp: 'Alex 9/25/2025 19:35:28'!
nodeValue
	^nodeInternalValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNode class' category: #'Stack-Exercise'!
OOStackNode class
	instanceVariableNames: 'data nextNode'!

!OOStackNode class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 07:55:52'!
withValue: aValue nextNode: aNode
	^self new initializeWithValue: aValue nextNode: aNode.! !


!classDefinition: #SFSentenceLengthResult category: #'Stack-Exercise'!
Object subclass: #SFSentenceLengthResult
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SFSentenceLengthResult methodsFor: 'length result actions' stamp: 'Alex 9/26/2025 13:37:21'!
matchPrefix: aPrefix With: aSentence In: aList
	^ self subclassResponsibility .! !


!classDefinition: #SFNotValidPrefixForSentence category: #'Stack-Exercise'!
SFSentenceLengthResult subclass: #SFNotValidPrefixForSentence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SFNotValidPrefixForSentence methodsFor: 'actions' stamp: 'Alex 9/26/2025 13:42:25'!
matchPrefix: aPrefix With: aSentence In: aList
	^ self .! !


!classDefinition: #SFValidPrefixForSentence category: #'Stack-Exercise'!
SFSentenceLengthResult subclass: #SFValidPrefixForSentence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SFValidPrefixForSentence methodsFor: 'actions' stamp: 'Alex 9/26/2025 14:42:26'!
matchPrefix: aPrefix With: aSentence In: aList

	(aPrefix = (aSentence copyFrom: 1 to: aPrefix size)) and: [aList addFirst: aSentence ].! !


!classDefinition: #SFValidPrefixChecker category: #'Stack-Exercise'!
Object subclass: #SFValidPrefixChecker
	instanceVariableNames: 'prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SFValidPrefixChecker methodsFor: 'initialization' stamp: 'Alex 9/26/2025 01:16:35'!
initializeWithPrefix: aPrefix 
	prefix  := aPrefix .
	
	! !


!SFValidPrefixChecker methodsFor: 'validation actions' stamp: 'Alex 9/26/2025 14:42:42'!
prefixCantBeEmpty

	prefix isEmpty and: [  self error: SentenceFinderByPrefix prefixIsEmptyErrorDescription ].
		! !

!SFValidPrefixChecker methodsFor: 'validation actions' stamp: 'Alex 9/26/2025 14:42:54'!
prefixCantHaveBlanckSpaces

	(prefix includes: Character space) and: [ self error: SentenceFinderByPrefix prefixHasBlankSpacesErrorDescription ].
		
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SFValidPrefixChecker class' category: #'Stack-Exercise'!
SFValidPrefixChecker class
	instanceVariableNames: ''!

!SFValidPrefixChecker class methodsFor: 'initialize instance' stamp: 'Alex 9/26/2025 01:16:57'!
for: aPrefix 
	^ self new initializeWithPrefix: aPrefix .! !


!classDefinition: #SFValidSentenceForPrefix category: #'Stack-Exercise'!
Object subclass: #SFValidSentenceForPrefix
	instanceVariableNames: 'prefix sentence'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SFValidSentenceForPrefix methodsFor: 'validation actions' stamp: 'Alex 9/26/2025 15:00:45'!
whenValidPrefixSizeForCurrentSentenceAddIn: aList

	| condition |
	
	condition := prefix size <= sentence size.
	condition and: [SFValidPrefixForSentence new matchPrefix: prefix With: sentence In: aList ].
	condition or: [SFNotValidPrefixForSentence new matchPrefix: prefix With: sentence In: aList ].! !


!SFValidSentenceForPrefix methodsFor: 'initialization' stamp: 'Alex 9/26/2025 13:17:38'!
initializeWith: aPrefix For: aSentence
	prefix := aPrefix.
	sentence := aSentence .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SFValidSentenceForPrefix class' category: #'Stack-Exercise'!
SFValidSentenceForPrefix class
	instanceVariableNames: ''!

!SFValidSentenceForPrefix class methodsFor: 'instance initialization' stamp: 'Alex 9/26/2025 13:18:47'!
for: aPrefix in: aSentence
	^ self new initializeWith: aPrefix For: aSentence.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'actions' stamp: 'Alex 9/26/2025 15:01:07'!
findSentencesWithPrefix: aPrefix InStack: aStack
		
	| currentSentence sentencesInStack sentencesWithSamePrefix validPrefixChecker validSentenceForPrefixChecker|
	
	validPrefixChecker := SFValidPrefixChecker for: aPrefix. 
	
	validPrefixChecker prefixCantBeEmpty .
	validPrefixChecker prefixCantHaveBlanckSpaces .
	
	sentencesWithSamePrefix := OrderedCollection new.
	sentencesInStack  := OrderedCollection new.
	
	
	[aStack isEmpty not] whileTrue: [
		
			currentSentence := aStack pop.
			sentencesInStack addFirst: currentSentence.
			
			validSentenceForPrefixChecker := SFValidSentenceForPrefix for: aPrefix in: currentSentence.
			validSentenceForPrefixChecker whenValidPrefixSizeForCurrentSentenceAddIn: sentencesWithSamePrefix.
			
		].
	
	sentencesInStack do: [:aSentence | aStack push: aSentence ].
	
	 ^ sentencesWithSamePrefix ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'sentenceFinder erro descriptions' stamp: 'Alex 9/25/2025 20:27:35'!
prefixHasBlankSpacesErrorDescription
	^'The prefix has blank spaces!!!!!!'! !

!SentenceFinderByPrefix class methodsFor: 'sentenceFinder erro descriptions' stamp: 'Alex 9/25/2025 20:27:44'!
prefixIsEmptyErrorDescription
	^'The prefix is empty!!!!!!'! !


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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:52:16'!
test01StackWithNoItemsCantFindPrefix
	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	prefix := 'hola'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:52:12'!
test02StackWithItemsCantFindPrefix

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	stack push: 'como estás?'.
	prefix := 'hola'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:52:23'!
test03StackWithItemsCanFindAPrefix

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	stack push: 'como estás?'.
	prefix := 'com'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack last = 'como estás?' .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:52:30'!
test04SentencesFinderCanDifferenciateCapsFromNoCaps

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	stack push: 'como estás?'.
	stack push:'Como pollo'.
	stack push: 'Como estás?'.
	prefix := 'com'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack size = 1.
	self assert: prefixsFoundInStack last = 'como estás?'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:52:37'!
test05SentenceFinderCanFindMoreThan1Item

	| stack prefix sentenceFinder prefixsFoundInStack|
	
	stack := OOStack new.
	stack push: 'como estás?'.
	stack push: 'como pollo'.
	stack push: 'Como estás?'.
	prefix := 'com'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack  includes: 'como estás?' .
	self assert: prefixsFoundInStack  includes: 'como pollo' .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:08'!
test06StackStaysTheSameAfterUsingSentenceFinder

	| stackForPrefixFInder stackNotUsedInPrefixFinder prefix sentenceFinder prefixsFoundInStack|
	
	stackForPrefixFInder := OOStack new.
	stackForPrefixFInder push: 'como estás?'.
	stackForPrefixFInder push: 'como pollo'.
	stackForPrefixFInder push: 'Como estás?'.
	
	stackNotUsedInPrefixFinder := OOStack new.
	stackNotUsedInPrefixFinder push: 'como estás?'.
	stackNotUsedInPrefixFinder push: 'como pollo'.
	stackNotUsedInPrefixFinder push: 'Como estás?'.
	
	prefix := 'com'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stackForPrefixFInder .
	
	self assert: stackForPrefixFInder size = stackNotUsedInPrefixFinder size.
	
	[stackForPrefixFInder isEmpty not] whileTrue: [
		self assert: stackForPrefixFInder pop = stackNotUsedInPrefixFinder pop.
	]

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:16'!
test07EmptyStackStaysEmptyAfterSentenceFinder
	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	prefix := 'hola'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: stack isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:23'!
test08CantUseEmptyPrefix

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	prefix := ''.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix  prefixIsEmptyErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:28'!
test09CantUseBlankSpaceInPrefix

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	prefix := 'hola '.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix  prefixHasBlankSpacesErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:35'!
test10PrefixCantBeBlankSpace

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	prefix := ' '.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix  prefixHasBlankSpacesErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:42'!
test11SentenceFinderDoesntFindWordsWhenPrefixIsLongerThanTheSentence	
	
	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	stack push: 'como estás?'.
	stack push: 'hola'.
	stack push: 'holalala'.
	prefix := 'holala'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack last = 'holalala'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Alex 9/26/2025 14:53:51'!
test12SentenceFinderCanFindDuplicatedWords

	| stack prefix sentenceFinder prefixsFoundInStack |
	
	stack := OOStack new.
	stack push: 'como estás?'.
	stack push: 'hola'.
	stack push: 'como estás?'.
	prefix := 'com'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	prefixsFoundInStack := sentenceFinder findSentencesWithPrefix: prefix InStack: stack.
	
	self assert: prefixsFoundInStack last = 'como estás?' .! !
