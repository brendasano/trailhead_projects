public class AccountHandler {
    public static Account insertNewAccount (String accName){
        try {
            // This causes an exception because 
            //   the required Name field is not provided.
            Account acct = new Account(Name=accName);
            // Insert the account 
            insert acct;
            System.debug('testtttt::::'+acct);
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
    }
}