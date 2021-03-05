/* sfdcMonkey.com
   API : 46
   Date : 8/7/2019 */  
   public with sharing class customSearchController {
  
    @AuraEnabled(cacheable=true)
     public static list<contact> getContactList(string searchKey) {
         string sTempSearchKey = '%' + searchKey + '%';
         
        // create contact list to store search result 
         list<contact> lstContact = new list<contact>();
      
        // query contact records
         for(contact oCon : [Select id,Name,Email,FirstName,LastName,Phone
                             From Contact
                             WHERE name LIKE : sTempSearchKey]){
            lstContact.add(oCon);
         }
         
        //If there are no records found with searchKey then, throw aura exception with a message
          if(lstContact.size() == 0){
             throw new AuraHandledException('No Record Found..'); 
          }
          
         return lstContact;
     }
 }