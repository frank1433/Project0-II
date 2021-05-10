trigger updatebottle on producer__c (after update) {
    List<bottle__c> botList= new List<bottle__c>();
    List<bottle__c> upbotList= new List<bottle__c>();
    
    for(producer__c prod :Trigger.new){
        botList=[select Name, Producer_Name__c from bottle__c where wineproducer__c=:prod.Id];
        for(bottle__c bot : botList){
            bot.Producer_Name__c=prod.Producer_Name__c;
            upbotList.add(bot);
        }
    }
 
    if(upbotList.size()>0){
        update upbotList;
    }
}