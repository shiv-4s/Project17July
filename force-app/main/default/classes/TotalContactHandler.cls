public  class TotalContactHandler {
    public static void countContacts(List<Contact> newList){
        Set<id> accountIds = new Set<id>();
        if(newList!= null){
            for(Contact c: newList){
                if(c.accountId!= null){
                    accountIds.add(c.accountId);
                }
            }
        }
        List<Account> accounts = [select Id, Total_no_accounts__c, (select Id from Contacts) from Account where Id in: accountIds];
        List<Contact> deleteContactsList = new List<Contact>();
        for(Account acc : accounts){
            acc.Total_no_accounts__c = acc.Contacts.size();
        }
        UPDATE accounts;
    }
    public static void contactDelete(List<Contact> newList) {
        Set<Id> accountId1 = new Set<Id>();
        if(newList!= null){
            for(Contact c: newList){
                accountId1.add(c.accountId);
            }
        }
        List<Account> accounts = [SELECT Id,Name, Total_no_accounts__c,(select Id from Contacts) FROM Account WHERE Id in: accountId1];
        List<Account> contactsList = new List<Account>();
        for(Account acc : accounts){
            acc.Total_no_accounts__c = acc.Contacts.size();
            contactsList.add(acc);
        }
        
        UPDATE contactsList;
    }
    
    
    // delete all the contact when we reach total count is 5 or more and update new contact
    public static void checkAccount(List<Contact> newList){
        Set<id> accountIds = new Set<id>();
        if(newList!= null){
            for(Contact c: newList){
                if(c.accountId!= null){
                    accountIds.add(c.accountId);
                }
            }
        }
        List<Account> accounts = [SELECT Id,Name, Total_no_accounts__c,(select Id from Contacts) FROM Account WHERE Id in: accountIds];
        List<Contact> listacc = new List<Contact>();
         system.debug('  list ');
        for(Account act: accounts){
            if(act.Total_no_accounts__c >=5){
                listacc.addAll(act.Contacts);
                system.debug('  list '+listacc);
                    }
        }
        DELETE listacc;
       
    }
}
