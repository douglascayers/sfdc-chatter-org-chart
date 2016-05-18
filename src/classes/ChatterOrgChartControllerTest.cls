@isTest
private class ChatterOrgChartControllerTest {

    @isTest
    static void test_get_users() {

        User manager = null;
        User chatterUser = null;
		User directReport = null;

		Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

        System.runAs( new User( id = UserInfo.getUserId() ) ) {
	 String orgId = UserInfo.getOrganizationId();
    	 String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
	 Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
	 String uniqueName = orgId + dateString + randomInt;
            manager = new User(
            	Alias = 'standt',
                Email='standarduser@testorg.com',
                EmailEncodingKey='UTF-8',
                LastName='Testing',
                LanguageLocaleKey='en_US',
				LocaleSidKey='en_US',
                ProfileId = p.Id,
               	TimeZoneSidKey='America/Los_Angeles',
                UserName= uniqueName+'manager@testorg.com'
            );
            insert manager;

            chatterUser = new User(
            	Alias = 'standt',
                Email='standarduser@testorg.com',
                EmailEncodingKey='UTF-8',
                LastName='Testing',
                LanguageLocaleKey='en_US',
				LocaleSidKey='en_US',
                ProfileId = p.Id,
               	TimeZoneSidKey='America/Los_Angeles',
                UserName= uniqueName+'chatteruser@testorg.com',
                managerId = manager.id
            );
            insert chatterUser;

            directReport = new User(
            	Alias = 'standt',
                Email='standarduser@testorg.com',
                EmailEncodingKey='UTF-8',
                LastName='Testing',
                LanguageLocaleKey='en_US',
				LocaleSidKey='en_US',
                ProfileId = p.Id,
               	TimeZoneSidKey='America/Los_Angeles',
                UserName= uniqueName+'directReport@testorg.com',
                managerId = chatterUser.id
            );
            insert directReport;

        }

        Test.startTest();

        ApexPages.currentPage().getParameters().put( 'sfdc.userId', chatterUser.id );
        ChatterOrgChartController controller = new ChatterOrgChartController( new ApexPages.StandardController( chatterUser ) );
        User record = controller.chatterUser;
        Boolean canManageUsers = controller.canManageUsers;

        Test.stopTest();

        System.assertEquals( chatterUser.id, record.id );
        System.assertEquals( manager.id, record.manager.id );
        System.assertEquals( directReport.id, record.ManagedUsers[0].id );
        System.assertEquals( true, canManageUsers );

    }

}
