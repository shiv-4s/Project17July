@isTest
public class TestContact {	
     @isTest static void insertMethod(){
        Account acc = new Account();
        acc.Name = 'Test';
        INSERT acc;
        
        List<Contact> cnt = new List<Contact>();
        for(Integer i =0; i<5; i++){
            cnt.add(new Contact(LastName = 'shivam'+i, AccountId = acc.Id));
        }
        INSERT cnt;
        List<Contact> accnt = [SELECT Id FROM contact WHERE AccountId =: acc.Id];
        System.assertEquals(5, accnt.size());
    }
    @isTest static void deleteMethod(){
        Account acc1 = new Account();
        acc1.Name = 'Test 1';
        INSERT acc1;
        
        Contact cnt1 = new Contact();
        cnt1.LastName = 'wer';
        cnt1.AccountId = acc1.Id;
        INSERT cnt1;
          Contact cnt2 = new Contact();
        cnt2.LastName = 'wer';
        cnt2.AccountId = acc1.Id;
        INSERT cnt2;
          Contact cnt3 = new Contact();
        cnt3.LastName = 'wer';
        cnt3.AccountId = acc1.Id;
        INSERT cnt3;
          Contact cnt4 = new Contact();
        cnt4.LastName = 'wer';
        cnt4.AccountId = acc1.Id;
        INSERT cnt4;
          Contact cnt5 = new Contact();
        cnt5.LastName = 'hjk';
        cnt5.AccountId = acc1.Id;
        INSERT cnt5;
        
        List<Contact> conlist = [SELECT Id FROM Contact WHERE AccountId =:acc1.Id AND LastName = 'wer'];
        DELETE conlist;
        
        List<Contact> conlist1 = [SELECT Id FROM Contact WHERE AccountId=:acc1.Id];
        System.assertEquals(1, conlist1.size());
    }
    
    
}