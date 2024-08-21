@isTest
public class AccountProcessorTest {
    @isTest
    static void countContactsTest(){
        List<Account> accountsToInsert = new List<Account>{
        	new Account(Name = 'Test Acc 1'),
            new Account(Name = 'Test Acc 2'),
            new Account(Name = 'Test Acc 3')
        };
        insert accountsToInsert;
        
        List<Contact> contactsToInsert = new List<Contact>{
            new Contact(FirstName = 'Lolita', LastName = 'Banana', AccountId = accountsToInsert[0].Id),
            new Contact(FirstName = 'Gala', LastName = 'Varo', AccountId = accountsToInsert[0].Id),
            new Contact(FirstName = 'Pixie', LastName = 'Pixie', AccountId = accountsToInsert[0].Id),
            new Contact(FirstName = 'Cristian', LastName = 'Peralta', AccountId = accountsToInsert[1].Id),
            new Contact(FirstName = 'Matraka', LastName = 'Traka', AccountId = accountsToInsert[1].Id),
            new Contact(FirstName = 'Regina', LastName = 'Voce', AccountId = accountsToInsert[2].Id)
        };
        insert contactsToInsert;
        
        List<Id> accountIds = new List<Id>{
            accountsToInsert[0].Id,
            accountsToInsert[1].Id,
            accountsToInsert[2].Id
        };
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        List<Account> testAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :accountIds];
        System.assertEquals(3, testAccounts[0].Number_Of_Contacts__c, 'Number of contacts for Test Account 1 should be 3');
        System.assertEquals(2, testAccounts[1].Number_Of_Contacts__c, 'Number of contacts for Test Account 2 should be 2');
        System.assertEquals(1, testAccounts[2].Number_Of_Contacts__c, 'Number of contacts for Test Account 3 should be 1');
    }
}