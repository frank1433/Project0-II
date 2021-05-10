@isTest
public class TestProducerUpSert {
        
    @isTest static void TestUpdateProducerWithBottle(){
        //test data
        //creat a producer with 5 bottle try to update it.
        producer__c prod=new producer__c(Name='test',
                                         Producer_Name__c='Test Producer');
        insert prod;
        List<bottle__c> bottleList=new List<bottle__c>();
        for (Integer i=0; i<5; i++){
            bottle__c bot=new bottle__c(Name__c='test bottle'+i,
                                        Producer_Name__c=prod.Producer_Name__c,
                                        wineproducer__c=prod.Id);
            bottleList.add(bot);
        }
        insert bottleList;
        producer__c prodU =[select Id, Name, Producer_Name__c from producer__c where Name='test']; 
        Test.startTest();
        prodU.Producer_Name__c='New producer';
        Database.SaveResult result=Database.update(prodU, false);
        Test.stopTest();
       
        //verify
        //in this case the update is successful and bottle's producer_name is changed to new name.
        System.assert(result.isSuccess());
        for (bottle__c bottle : [select Id, Producer_Name__c from bottle__c where wineproducer__c =:prodU.Id]){
            System.assertEquals('New producer', bottle.Producer_Name__c);
        }
        
    }
}