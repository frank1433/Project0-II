@isTest
public class TestCityDelete {
    @isTest 
    static void TestDeleteCityWithStore(){
    //test data setup 
    //create a city with a store in that city
    City__c city=new City__c(city_Name__c='test city');
    insert city;
    store__c store=new store__c(store_name__c='test store',
                                storeincity__c=city.Id);
    insert store;
    Test.startTest();
    Database.DeleteResult result = Database.delete(city, false);
    Test.stopTest();
     System.assert(!result.isSuccess());
     System.assert(result.getErrors().size() > 0);
     System.assertEquals('Cannot delete city with related stores.',
                             result.getErrors()[0].getMessage());
    }
}