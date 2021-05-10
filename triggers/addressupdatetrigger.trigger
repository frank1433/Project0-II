trigger addressupdatetrigger on Customer__c (before insert, before update) {
    //List<Customer__c> custList=new List<Customer__c>();
    for(Customer__c customer : Trigger.New){
        if (customer.address_matching__c==true){
        customer.shippingstreeet__c=customer.billingstreet__c;
        customer.shippingcity__c=customer.billingcity__c;
        customer.shippingstate__c=customer.billingstate__c;
        customer.shippingpostalcode__c=customer.billingpostalcode__c;
        customer.shippingcountry__c=customer.billingcountry__c;
        //custList.add(customer);
        }
    }
    //upsert custList;
}