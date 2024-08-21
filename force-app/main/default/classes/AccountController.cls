/**
 * @description       : 
 * @author            : Brenda Sanchez
 * @group             : 
 * @last modified on  : 07-02-2023
 * @last modified by  : Brenda Sanchez
**/
public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
      return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
    }
  }