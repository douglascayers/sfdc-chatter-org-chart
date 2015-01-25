Overview
========

Chatter Org Chart is a simple visualforce page designed to be a [custom profile tab](https://developer.salesforce.com/docs/atlas.en-us.salesforce_profile_tabs_cheatsheet.meta/salesforce_profile_tabs_cheatsheet/salesforce_profile_customtabdef.htm) on the [subtab apps](https://developer.salesforce.com/docs/atlas.en-us.salesforce_profile_tabs_cheatsheet.meta/salesforce_profile_tabs_cheatsheet/dev_subtab_def.htm) **Profile (Self)** and **Profile (Others)**.

This new profile tab leverages the hierarchical relationship of the **manager** field on the user object to display the chatter user's manager, the user, and their direct reports. You can click on the user profile photos to navigate the org chart.

Administrators (users with at least one of these permissions: Manage Users, Manage Internal Users, or Modify All Data) will see a blue pencil-icon in upper-right that they can click to edit basic details, most importantly the Manager field. Administrators can assign a manager to a Chatter Free user, and Chatter Free users can be assigned as managers of other users. No more relying on data loaders or writing your own apex code.

![screenshot](/images/chatter-org-chart.png)

Click the pencil-icon to pull up basic edit screen:
![screenshot](/images/chatter-org-chart-edit-user.png)

Change manager by typing a new name with autocomplete results:
![screenshot](/images/chatter-org-chart-edit-manager.png)

3 Step Setup
============
1. Easily deploy the metadata in this repo to your org with one-click (see deployment instructions below)
2. Assign users the **Chatter Org Chart** permission set
3. Go to **Setup | Create | Apps** and assign the **Org Chart** profile tab to Chatter for both the Subtab Apps **Profile (Others)** and **Profile (self)**

Deployment: How To
==================

<a href="https://githubsfdeploy.herokuapp.com?owner=douglascayers&repo=sfdc-chatter-org-chart">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

To simplify deployment of this custom code to your org, you may use the [github deploy tool](http://andyinthecloud.com/2013/09/24/deploy-direct-from-github-to-salesforce/) developed by [Andy Fawcett](https://twitter.com/andyinthecloud).

To deploy in your **sandbox**:
https://githubsfdeploy-sandbox.herokuapp.com/app/githubdeploy/douglascayers/sfdc-chatter-org-chart

To deploy to **production**:
https://githubsfdeploy.herokuapp.com/app/githubdeploy/douglascayers/sfdc-chatter-org-chart

*If deploying to production via github tool fails due to tests not being run, you may opt to use Change Sets or Ant Tool or however you normally deploy your code from sandbox to production. Please use your best judgement and due diligence before making any production changes to your org.*
