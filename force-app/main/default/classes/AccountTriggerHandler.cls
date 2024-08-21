public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts){
        for (Account a : accounts) {
            if(a.BillingState != a.ShippingState ){
                a.ShippingState = a.BillingState;
            }
        }
    }
}