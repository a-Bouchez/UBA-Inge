!classDefinition: #AccountTransaction category: 'Portfolio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!AccountTransaction methodsFor: 'value' stamp: 'A 10/30/2025 12:47:00'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'A 10/26/2025 19:15:56'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!Deposit methodsFor: 'initialization' stamp: 'A 10/30/2025 12:46:19'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'A 10/30/2025 12:47:15'!
value
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!Withdraw methodsFor: 'initialization' stamp: 'A 10/30/2025 12:46:36'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'A 10/30/2025 12:47:22'!
value
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialAsset category: 'Portfolio'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!FinancialAsset methodsFor: 'asserts' stamp: 'A 10/30/2025 14:19:06'!
hasRegistered: anAsset
	self subclassResponsibility .! !


!FinancialAsset methodsFor: 'balance' stamp: 'A 10/30/2025 14:19:34'!
balance
	self subclassResponsibility .! !


!FinancialAsset methodsFor: 'transactions' stamp: 'A 10/30/2025 14:19:54'!
transactions
	self subclassResponsibility .! !


!FinancialAsset methodsFor: 'find assets' stamp: 'A 10/30/2025 16:46:09'!
addParent: aParentPortfolio
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'find assets' stamp: 'A 10/30/2025 16:05:44'!
findAllAccounts
	self subclassResponsibility .! !

!FinancialAsset methodsFor: 'find assets' stamp: 'A 10/30/2025 17:21:55'!
includesPortfolio: aPortfolio
	self subclassResponsibility .! !


!classDefinition: #Portfolio category: 'Portfolio'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'assets parentPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!Portfolio methodsFor: 'initialize' stamp: 'A 10/30/2025 16:42:23'!
initialize
	assets := OrderedCollection new.
	parentPortfolio := nil.
	
! !


!Portfolio methodsFor: 'add' stamp: 'A 10/31/2025 00:46:43'!
add: anAsset 

	self itsNotADuplicatedAsset: anAsset.

	assets add: anAsset.
	anAsset addParent: self.
	! !

!Portfolio methodsFor: 'add' stamp: 'A 10/30/2025 17:39:11'!
findAllAccounts
	^ assets inject: OrderedCollection new into: [:all :each |
		all addAll: each findAllAccounts.
		all
	]! !


!Portfolio methodsFor: 'asserts' stamp: 'A 10/30/2025 14:43:36'!
accountsIncludes: anAsset 
	^ assets includes: anAsset .! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/30/2025 14:45:08'!
accountsIsEmpty
	^ assets isEmpty .! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/30/2025 14:46:07'!
accountsSize
	^ assets size.! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 00:56:44'!
assetCantBeADuplicatedAccount: anAsset

	^ (self findAllAccounts includesAnyOf: anAsset findAllAccounts) ifTrue: [self error: self class cantAddDuplicateAssetErrorDescription ]! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 00:53:48'!
assetCantBeADuplicatedPortfolio: anAsset

	(anAsset includesPortfolio: self) ifTrue: [ self error: self class cantAddDuplicateAssetErrorDescription ].
	
	(self includesPortfolio: anAsset)ifTrue: [ self error: self class cantAddDuplicateAssetErrorDescription ]! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 01:08:54'!
assetCantBeDuplicatedInParentOrChilds: anAsset

	self assetCantBeADuplicatedAccount: anAsset.

	self assetCantBeInParentPortfolio: anAsset! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 01:02:22'!
assetCantBeInParentPortfolio: anAsset

	^ (self findAccountsInParent: anAsset findAllAccounts) ifTrue: [self error: self class cantAddDuplicateAssetErrorDescription ]! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 00:48:03'!
assetCantBeSelf: anAsset

	^ (self == anAsset)ifTrue: [ self error: self class cantAddDuplicateAssetErrorDescription ]! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/30/2025 14:26:09'!
hasRegistered: anAsset

	^ assets anySatisfy: [:asset| asset hasRegistered: anAsset ]
	
	! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 00:34:10'!
includesPortfolio: aPortfolio
	^ assets anySatisfy: [:each |
		each == aPortfolio or: [
			(each isKindOf: Portfolio) and: [each includesPortfolio: aPortfolio]
		]
	]! !

!Portfolio methodsFor: 'asserts' stamp: 'A 10/31/2025 01:08:54'!
itsNotADuplicatedAsset: anAsset

	self assetCantBeSelf: anAsset.
	
	self assetCantBeADuplicatedPortfolio: anAsset.
		
	self assetCantBeDuplicatedInParentOrChilds: anAsset! !


!Portfolio methodsFor: 'balance' stamp: 'A 10/30/2025 14:28:31'!
balance
	^ assets sum:[:asset| asset balance] ifEmpty: [0].

	! !


!Portfolio methodsFor: 'transactions' stamp: 'A 10/30/2025 14:34:38'!
transactions
	| allTransactions |
	
	allTransactions := OrderedCollection new.
	
	assets do: [:asset| allTransactions addAll: asset transactions ].
	
	^allTransactions .
	! !


!Portfolio methodsFor: 'parent' stamp: 'A 10/30/2025 16:47:11'!
addParent: aParentPortfolio
	parentPortfolio := aParentPortfolio .! !

!Portfolio methodsFor: 'parent' stamp: 'A 10/30/2025 16:57:24'!
findAccountsInParent: anAccountList

	parentPortfolio isNil ifTrue: [ ^false ].
	
	(parentPortfolio findAllAccounts anySatisfy: [:acc | anAccountList includes: acc]) ifTrue: [ ^true ].
	
	^ parentPortfolio findAccountsInParent: anAccountList .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'A 10/30/2025 15:24:33'!
cantAddDuplicateAssetErrorDescription
	^'Ya tenes esa cuenta agregada!!!!!!'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'A 10/31/2025 00:17:31'!
with: anAsset
	| portfolio |
	portfolio := self new.
	portfolio add: anAsset .
	^portfolio 
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'A 10/31/2025 00:18:17'!
with: anAsset with: anotherAsset
	| portfolio |
	portfolio := self new.
	portfolio add: anAsset .
	portfolio add: anotherAsset .
	^portfolio 
	! !


!classDefinition: #ReceptiveAccount category: 'Portfolio'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'A 10/30/2025 13:32:49'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'A 10/26/2025 17:36:30'!
balance

	^transactions sum: [ :aTransaction | 
		aTransaction class = Deposit 
			ifTrue: [aTransaction value] 
			ifFalse:  [ aTransaction value * (-1)] ] 
		ifEmpty: [ 0 ].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'extras - for Portfolio methods' stamp: 'A 10/30/2025 16:46:35'!
addParent: aParentPortfolio 
	^ self! !

!ReceptiveAccount methodsFor: 'extras - for Portfolio methods' stamp: 'A 10/30/2025 17:42:05'!
findAllAccounts
	^ {self} ! !

!ReceptiveAccount methodsFor: 'extras - for Portfolio methods' stamp: 'A 10/30/2025 17:35:56'!
includesPortfolio: aPortfolio
	^ false! !


!classDefinition: #PortfolioTest category: 'Portfolio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/31/2025 01:14:48'!
test01PortfolioCanAddAnAccount
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account .
	
	self assert: (portfolio accountsIncludes: account).
	self deny: portfolio accountsIsEmpty .! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/31/2025 01:12:50'!
test02PortfolioDoestnHaveAnUnregisteredAccount
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := Portfolio new .
	
	self deny: (portfolio accountsIncludes: account ).
	self assert: portfolio accountsIsEmpty.
	self assert: portfolio accountsSize equals: 0! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/31/2025 01:15:13'!
test03PortfolioCanAddMultiplesAccounts
	| portfolio account anotherAccount |
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio with: account with: anotherAccount .
	
	self assert: (portfolio accountsIncludes: account ).
	self assert: (portfolio accountsIncludes: anotherAccount ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:43:36'!
test04PortfolioCanAddAPortfolio
	| portfolio anotherPortfolio|
	anotherPortfolio := Portfolio new.
	portfolio := Portfolio new .
	
	portfolio add: anotherPortfolio .
	
	self assert: (portfolio accountsIncludes: anotherPortfolio).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:43:36'!
test05PortfolioDoesntHaveAnUnregisteredPortfolio
	| portfolio anotherPortfolio|
	anotherPortfolio := Portfolio new.
	portfolio := Portfolio new .
	
	self deny: (portfolio accountsIncludes: anotherPortfolio).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:43:36'!
test06PortfolioCanAddMultiplesPortfolios
	| portfolio anotherPortfolio otherPortfolio|
	anotherPortfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	portfolio := Portfolio new .
	
	portfolio add: anotherPortfolio .
	portfolio add: otherPortfolio .
	
	self assert: (portfolio accountsIncludes: anotherPortfolio).
	self assert: (portfolio accountsIncludes: otherPortfolio ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:36:57'!
test07PortfolioBalanceWithOneEmptyAccount
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := Portfolio new .
	
	portfolio add: account .
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:36:57'!
test08PortfolioBalanceWithOneAccount
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := Portfolio new .
	
	Deposit register: 100 on: account.
	portfolio add: account .
	
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:36:57'!
test09PortfolioBalanceWithMultipleAccounts
	| portfolio account otherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	portfolio := Portfolio new .
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: otherAccount .
	portfolio add: account .
	portfolio add: otherAccount .
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test10PortfolioBalanceWithEmptyPortfolio
	| portfolio otherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new .
	
	portfolio add: otherPortfolio.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test11PortfolioBalanceWithOnePortfolio
	| portfolio account otherAccount otherPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new .
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: otherAccount .
	
	otherPortfolio add: account .
	otherPortfolio add: otherAccount .
	
	portfolio add: otherPortfolio.
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test12PortfolioBalanceWithMultiplePortfolio
	| portfolio account otherAccount otherPortfolio anotherPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new .
	anotherPortfolio := Portfolio new .
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: otherAccount .
	
	otherPortfolio add: account .
	anotherPortfolio add: otherAccount .
	
	portfolio add: otherPortfolio.
	portfolio add: anotherPortfolio .
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test13PortfolioBalanceWithMultiplePortfolioAndMultipleAccounts
	| portfolio account otherAccount anotherAccount otherPortfolio anotherPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new .
	anotherPortfolio := Portfolio new .
	
	Deposit register: 100 on: account.
	Withdraw register: 50 on: otherAccount .
	Withdraw register: 50 on: anotherAccount .
	
	otherPortfolio add: account .
	anotherPortfolio add: otherAccount .
	
	portfolio add: otherPortfolio.
	portfolio add: anotherPortfolio .
	portfolio add: anotherAccount .
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 13:24:09'!
test14PortfolioDoesntRegisterTransacionsFromUnregisteredAccounts
	| portfolio account deposit|
	account := ReceptiveAccount new.	
	portfolio := Portfolio new .
	
	deposit := Deposit register: 100 on: account.
				
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:36:57'!
test15PortfolioHasTransactionRegisteredFromAccount
	| portfolio account deposit|
	account := ReceptiveAccount new.	
	portfolio := Portfolio new .
	
	portfolio add: account .
	
	deposit := Deposit register: 100 on: account.
				
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test16PortfolioHasTransactionsRegisteredFromManyAccountsInPortfolios
	| portfolio account otherAccount otherPortfolio deposit|
	account := ReceptiveAccount new.	
	portfolio := Portfolio new .
	otherAccount := ReceptiveAccount new.
	otherPortfolio := Portfolio new .
	
	portfolio add: account .
	otherPortfolio add: otherAccount .
	portfolio add: otherPortfolio .
	
	Deposit register: 100 on: account. 
	deposit := Deposit register: 50 on: otherAccount .
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 13:25:50'!
test17NewPortfolioDoesntHaveTransactions
	| portfolio |
	portfolio := Portfolio new .
	
	self assert: portfolio transactions isEmpty .! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:36:57'!
test18PortfolioHasAccountTransactions
	| portfolio account |
	portfolio := Portfolio new .
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account . 
	
	portfolio add: account.
	
	self assert: portfolio transactions = account transactions .! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 14:41:22'!
test19PortfolioHasOtherPortfoliosTransactions
	| portfolio account otherAccount otherPortfolio|
	portfolio := Portfolio new .
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	otherPortfolio := Portfolio new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account .
	Deposit register: 70 on: otherAccount.
	
	portfolio add: account.
	otherPortfolio add: otherAccount .
	portfolio add: otherPortfolio .
	
	self assert: portfolio transactions = (account transactions , otherAccount transactions ) .! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 15:23:51'!
test20PortfolioDoesntHaveTheSameAccountTwice
	| portfolio account |
	portfolio := Portfolio new .
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account . 
	
	portfolio add: account.
	
	self 
		should: [portfolio add: account ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 16:16:29'!
test21PortfolioCantAddAnAccountRegisteredInARegisteredPortfolio
	| portfolio account otherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account . 
	
	portfolio add: otherPortfolio .
	otherPortfolio add: account .
	
	self 
		should: [portfolio add: account ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 16:16:47'!
test22PortfolioCantAddOtherPortfolioWithARegisteredAccount
	| portfolio account otherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account . 
	
	portfolio add: account.
	otherPortfolio add: account .
	
	self 
		should: [portfolio add: otherPortfolio ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 16:21:38'!
test23PortfolioCantAddARegisteredAccountToARegisteredPortfolio
	| portfolio account otherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: account . 
	
	portfolio add: account.
	portfolio add: otherPortfolio .
	
	self 
		should: [otherPortfolio add: account ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 23:39:29'!
test24PortfolioCantAddARegisteredAccountToARegisteredPortfolioInRegisteredPortfolio
	| portfolio account otherPortfolio anotherPortfolio| 
	portfolio := Portfolio new . 
	otherPortfolio := Portfolio new. 
	anotherPortfolio := Portfolio new. 
	account := ReceptiveAccount new. 
	
	Deposit register: 100 on: account . 
	Withdraw register: 50 on: account . 
	
	portfolio add: account. 
	portfolio add: otherPortfolio . 
	otherPortfolio add: anotherPortfolio . 
	
	self 
		should: [anotherPortfolio add: account ] 
		raise: Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 17:05:12'!
test25PortfolioCantAddARegisteredPortfolio
	| portfolio otherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.

	portfolio add: otherPortfolio .
	
	self 
		should: [portfolio add: otherPortfolio ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 17:09:36'!
test26PortfolioCantAddItself
	| portfolio |
	portfolio := Portfolio new .
		
	self 
		should: [portfolio add: portfolio ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/30/2025 17:25:19'!
test27PortfolioCantAddARegisteredPortfolioInARegisteredPortfolio
	| portfolio otherPortfolio anotherPortfolio|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.

	portfolio add: otherPortfolio .
	otherPortfolio add: anotherPortfolio .
	
	self 
		should: [portfolio add: anotherPortfolio ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'A 10/31/2025 00:33:10'!
test28CantCreateACycleAddingARegisteredPortfolio
	| portfolio account otherPortfolio otherAccount|
	portfolio := Portfolio new .
	otherPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Withdraw register: 50 on: otherAccount . 
	
	portfolio add: account.
	otherPortfolio add: otherAccount .
	otherPortfolio add: portfolio .
	
	self 
		should: [portfolio add: otherPortfolio ]
		raise:  Error 
		withExceptionDo: [:error| self assert: Portfolio cantAddDuplicateAssetErrorDescription equals: error messageText ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !
