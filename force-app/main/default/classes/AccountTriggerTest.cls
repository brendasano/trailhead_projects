@isTest
public class AccountTriggerTest {
	@isTest
    static void createData(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            acc.BillingState = 'CA';
            accts.add(acc);
        }
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
         // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT ShippingState  FROM Account];
        for(Account acc : verifyAccts){
        	System.assertEquals('CA', acc.ShippingState);
        }
    }
}