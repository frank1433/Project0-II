trigger CityDeleteTrigger on city__c (before delete) {
      for (City__c city : [SELECT Id FROM City__c
                     WHERE Id IN (SELECT storeincity__c FROM store__c) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(city.Id).addError(
            'Cannot delete city with related stores.');
    }
    
}