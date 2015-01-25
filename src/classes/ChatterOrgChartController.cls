public with sharing class ChatterOrgChartController {

    // id of the user being viewed
    public ID userId { get; private set; }

    public User chatterUser {
        get {
            if ( chatterUser == null ) {
                chatterUser = [
                    SELECT
                        id, firstName, lastName, name, title, smallPhotoURL,
                        manager.id, manager.firstName, manager.lastName, manager.name, manager.title, manager.smallPhotoURL,
                        ( SELECT id, firstName, lastName, name, title, smallPhotoURL FROM ManagedUsers WHERE isActive = true ORDER BY name asc )
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

    public Boolean canManageUsers {
        get {
            if ( canManageUsers == null ) {

                List<PermissionSet> permsets = new List<PermissionSet>([
                    SELECT
                        id, PermissionsManageUsers, PermissionsManageInternalUsers, PermissionsModifyAllData
                    FROM
                        PermissionSet
                    WHERE
                        (
                            PermissionsManageUsers = true
                            OR
                            PermissionsManageInternalUsers = true
                            OR
                            PermissionsModifyAllData = true
                        )
                        AND
                        Id IN (
                            SELECT
                                permissionSetId
                            FROM
                                PermissionSetAssignment
                            WHERE
                                assigneeId = :UserInfo.getUserId()
                        )
                ]);

                canManageUsers = ( permsets.size() > 0 );
            }
            return canManageUsers;
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