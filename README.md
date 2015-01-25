<a href="https://githubsfdeploy.herokuapp.com?owner=douglascayers&repo=sfdc-chatter-org-chart">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

Chatter Org Chart
=================

Chatter Org Chart is a simple visualforce page designed to be a [custom profile tab](https://developer.salesforce.com/docs/atlas.en-us.salesforce_profile_tabs_cheatsheet.meta/salesforce_profile_tabs_cheatsheet/salesforce_profile_customtabdef.htm) on the [subtab apps](https://developer.salesforce.com/docs/atlas.en-us.salesforce_profile_tabs_cheatsheet.meta/salesforce_profile_tabs_cheatsheet/dev_subtab_def.htm) **Profile (Self)** and **Profile (Others)**.

This new profile tab leverages the hierarchical relationship of the **manager** field on the user object to display the chatter user's manager, the user, and their direct reports. You can click on the user profile photos to navigate the org chart.

Administrators (users with at least one of these permissions: Manage Users, Manage Internal Users, or Modify All Data) will see a blue pencil-icon in upper-right that they can click to edit basic details: name, title, and manager.

Chatter Free Users
==================
In addition to managing standard user types, administrators can now assign a manager to a **Chatter Free** user, and Chatter Free users can be assigned as managers of other users. No more relying on data loaders or writing your own apex code! However, at the time of this writing, Chatter Free users don't have access to visualforce and apex and sadly won't be able to interact with this Org Chart. Please vote for this idea https://success.salesforce.com/ideaView?id=08730000000l2gMAAQ.

![screenshot](/images/chatter-org-chart.png)

Click the blue pencil-icon in upper-right to pull up basic edit screen:
![screenshot](/images/chatter-org-chart-edit-user.png)

Change manager by typing a new name with autocomplete results:
![screenshot](/images/chatter-org-chart-edit-manager.png)

Installation
============
1. Easily [deploy this customization](https://githubsfdeploy.herokuapp.com?owner=douglascayers&repo=sfdc-chatter-org-chart) to your org with the [GitHub Salesforce Deploy Tool](http://andyinthecloud.com/2013/09/24/deploy-direct-from-github-to-salesforce/) authored by [Andy Fawcett](https://twitter.com/andyinthecloud)
2. Assign users the **Chatter Org Chart** permission set
3. Go to **Setup | Create | Apps** and assign the **Org Chart** profile tab to Chatter for both the Subtab Apps **Profile (Others)** and **Profile (self)**

![screenshot](/images/chatter-org-chart-subtab-apps-1.png)

Contributors
============
Many thanks to [Conglin Huang](https://github.com/conglinhuang) for his instruction and guidance on using angularjs to develop the user-edit form and manager field autocomplete.
