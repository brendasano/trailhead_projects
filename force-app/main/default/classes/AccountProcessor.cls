public class AccountProcessor {
    @future
    public static void countContacts (List<Id> accIds){
        List<Account> accountsToUpdate = new List<Account>();
        for(Id accId : accIds){
            Integer numberOfContacts = [SELECT count() FROM Contact WHERE AccountId =: accId];
            Account a = new Account(Id = accId, 
                                   Number_Of_Contacts__c = numberOfContacts);
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
        
    }
}