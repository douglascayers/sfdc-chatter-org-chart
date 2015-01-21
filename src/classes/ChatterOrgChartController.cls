public with sharing class ChatterOrgChartController {

    // id of the user being viewed
    public ID userId { get; private set; }

    public User chatterUser {
        get {
            if ( chatterUser == null ) {
                chatterUser = [
                    SELECT
                        id, name, title, smallPhotoURL,
                        manager.id, manager.name, manager.title, manager.smallPhotoURL,
                        ( SELECT id, name, title, smallPhotoURL FROM ManagedUsers WHERE isActive = true ORDER BY name asc )
                    FROM
                        User
                    WHERE
                        id = :userId
                    LIMIT 1  
                ];                
            }
            return chatterUser;
        }
        private set;
    }

    public ChatterOrgChartController( ApexPages.StandardController stdController ) {

        // get url parameter passed into profile tab indicating which user is being viewed
        userId = ApexPages.currentPage().getParameters().get( 'sfdc.userId' );
        
        if ( String.isBlank( userId ) ) {
            userId = UserInfo.getUserId();
        }

    }
    
}