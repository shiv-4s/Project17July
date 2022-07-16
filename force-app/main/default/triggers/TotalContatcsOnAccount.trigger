trigger TotalContatcsOnAccount on Account (before insert, after insert, after update, after delete) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            TotalContactHandler.countContacts(Trigger.new);
        }
        if(trigger.isDelete){
            TotalContactsHandler.contactDelete(Trigger.old);     
        } 
    }
    if(trigger.isBefore){
        
        if(trigger.isInsert){
            TotalContactsHandler.checkAccount(Trigger.new);
        }
        
    }
}