@isTest
public class AddressUpdateTest {
   @isTest
    static void updateAddressTestwithMatch(){
        //test data
        //creat an address with address_matching__c is true
        Customer__c customer=new Customer__c(billingstreet__c='test street',
                                             billingcity__c='test city',
                                             billingstate__c='test state',
                                             billingpostalcode__c='test code',
                                             billingcountry__c='test country',
                                             address_matching__c=true);
        Test.startTest();
        insert customer;
        Test.stopTest();
        
       // System.assert(result.isSuccess());
        Customer__c c=[select Id, shippingcity__c, shippingstreeet__c, shippingstate__c, billingcity__c, billingstreet__c, billingstate__c, billingpostalcode__c, billingcountry__c, shippingpostalcode__c,shippingcountry__c from Customer__c where billingcity__c='test city' ];
        System.assertEquals('test street', c.shippingstreeet__c);
        System.assertEquals('test city', c.shippingcity__c);
        System.assertEquals('test state', c.shippingstate__c);
        System.assertEquals('test code', c.shippingpostalcode__c);
        System.assertEquals('test country', c.shippingcountry__c);   
    }
    @isTest
    static void updateAddressTestwithoutMatch(){
        //test data
        //creat an address with address_matching__c is true
        Customer__c customer=new Customer__c(billingstreet__c='test street',
                                             billingcity__c='test city',
                                             billingstate__c='test state',
                                             billingpostalcode__c='test code',
                                             billingcountry__c='test country',
                                             address_matching__c=false);
        Test.startTest();
        insert customer;
        Test.stopTest();
        
       // System.assert(result.isSuccess());
        Customer__c c=[select Id, shippingcity__c, shippingstreeet__c, shippingstate__c, billingcity__c, billingstreet__c, billingstate__c, billingpostalcode__c, billingcountry__c, shippingpostalcode__c,shippingcountry__c from Customer__c where billingcity__c='test city' ];
        System.assertNotEquals('test street', c.shippingstreeet__c);
        System.assertNotEquals('test city', c.shippingcity__c);
        System.assertNotEquals('test state', c.shippingstate__c);
        System.assertNotEquals('test code', c.shippingpostalcode__c);
        System.assertNotEquals('test country', c.shippingcountry__c);  
        
    }
}