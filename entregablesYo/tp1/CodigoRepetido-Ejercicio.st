!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LL 9/11/2025 23:26:26'!
removeCustomerNamed: aName 

	
	(active includes: aName) ifTrue: [^self checkCustomer: aName fromCollection: active.].
	
	(suspended includes: aName) ifTrue: [^self checkCustomer: aName fromCollection: suspended.].
	
	^ NotFound signal
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'abstractions' stamp: 'LL 9/11/2025 23:22:38'!
checkCustomer: aName fromCollection: aCollection
	
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'abstractions' stamp: 'LL 9/11/2025 23:55:52'!
action: aBlockClosure onCustomerBook: aCustomerBook shouldNotTakeMoreThan: anAmountOfMilliseconds 

    |millisecondsBeforeRunning millisecondsAfterRunning|
    
    millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
    aBlockClosure value: aCustomerBook .
    millisecondsAfterRunning := Time millisecondClockValue * millisecond.
    
    self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (anAmountOfMilliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'Alex 9/12/2025 13:59:41'!
if: aConditionBlockClosure raisesTheError: errorName in: aCustomerBook checkForCustomer: aCustomerName

    " Primero se evalua el bloque, si modelamos bien, nos tira un error. En caso de que no salte el error esperado, el self fail me hace fallar el caso"
    [ aConditionBlockClosure  value.
    self fail ]
        on: errorName 
        do: [ self assert: aCustomerBook numberOfCustomers = 1.
		  self assert: (aCustomerBook includesCustomerNamed: aCustomerName)]
        
    ! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'LL 9/11/2025 23:48:27'!
inTheCostumerBook: aCustomerBook withActiveCostumersEqualTo: amountOfActiveCustomers  andSuspendedCostumersEqualTo: amountOfSuspendedCostumers doWeAlsoDelete: aBoolean nameOfTheSuspendedCostumer: aName

    self assert: amountOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
    self assert: amountOfSuspendedCostumers equals: aCustomerBook numberOfSuspendedCustomers.
    self assert: (amountOfActiveCustomers  + amountOfSuspendedCostumers ) equals: aCustomerBook numberOfCustomers.
    aBoolean  ifTrue:  [self deny: (aCustomerBook includesCustomerNamed: aName ).] ifFalse: [self assert: (aCustomerBook includesCustomerNamed: aName ).]! !


!CustomerBookTest methodsFor: 'testing' stamp: 'LL 9/11/2025 23:57:04'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

    | customerBook |
    
    customerBook := CustomerBook new.
    
    self action: [: aCustomerBook | aCustomerBook addCustomerNamed: 'John Lennon'] onCustomerBook: customerBook shouldNotTakeMoreThan: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LL 9/11/2025 23:57:42'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

    | customerBook paulMcCartney |
    
    customerBook := CustomerBook new.
    paulMcCartney := 'Paul McCartney'.
    
    customerBook addCustomerNamed: paulMcCartney.
      
    self action: [: aCustomerBook | aCustomerBook removeCustomerNamed: 'Paul McCartney'] onCustomerBook: customerBook shouldNotTakeMoreThan: 100.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Alex 9/12/2025 14:10:10'!
test03CanNotAddACustomerWithEmptyName 

    | customerBook |
            
    customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
       self fail ]
        on: Error 
        do: [ :anError | 
            self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
            self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Alex 9/12/2025 14:07:35'!
test04CanNotRemoveAnInvalidCustomer
    
	| customerBook johnLennon |
            
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self if: [ customerBook removeCustomerNamed: 'Paul McCartney']  raisesTheError: NotFound in: customerBook checkForCustomer: johnLennon ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LL 9/11/2025 23:59:21'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

    | customerBook paulMcCartney|
    
    customerBook := CustomerBook new.
    paulMcCartney := 'Paul McCartney'.
    
    customerBook addCustomerNamed: paulMcCartney.
    customerBook suspendCustomerNamed: paulMcCartney.
    
    
    self inTheCostumerBook: customerBook withActiveCostumersEqualTo: 0  andSuspendedCostumersEqualTo: 1 doWeAlsoDelete: false nameOfTheSuspendedCostumer: paulMcCartney! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LL 9/11/2025 23:48:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

    | customerBook paulMcCartney|
    
    customerBook := CustomerBook new.
    paulMcCartney := 'Paul McCartney'.
    
    customerBook addCustomerNamed: paulMcCartney.
    customerBook suspendCustomerNamed: paulMcCartney.
    customerBook removeCustomerNamed: paulMcCartney.
    
    self inTheCostumerBook: customerBook withActiveCostumersEqualTo: 0  andSuspendedCostumersEqualTo: 0 doWeAlsoDelete: true nameOfTheSuspendedCostumer: paulMcCartney


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Alex 9/12/2025 14:05:52'!
test07CanNotSuspendAnInvalidCustomer
    
	| customerBook johnLennon |
            
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self if: [ customerBook suspendCustomerNamed: 'George Harrison']  raisesTheError: CantSuspend in: customerBook checkForCustomer: johnLennon ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Alex 9/12/2025 14:03:13'!
test08CanNotSuspendAnAlreadySuspendedCustomer
    
	| customerBook johnLennon |
            
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
        

	self if: [ customerBook suspendCustomerNamed: johnLennon] raisesTheError: CantSuspend in: customerBook checkForCustomer: johnLennon ! !
