google-api-ABAP-client
======================

Google APIs Client Library for ABAP.

Starting with Google Glasses API.

To contribute:
Package -> ZGOOGLEAPIABAPCLIENT on GAR starts with the implementation of the config class


-------------------
PHP sample code
-------------------

<?php
  require_once 'Google/Client.php';
  require_once 'Google/Service/Mirror.php';
  $client = new Google_Client();
  $client->setApplicationName("Client_Library_Examples");
  $client->setDeveloperKey("YOUR_APP_KEY");
  $service = new Google_Service_Mirror($client);
  $results = $service->timeline->listTimeline();

  foreach ($results as $item) {
    //echo $item['volumeInfo']['title'], "<br /> \n";
  }
```

-------------------
ABAP sample code
-------------------

See report ZGOOGLE_TEST

--------------------------------------
Next steps for collaborators:
--------------------------------------

Config.php --> to terminate getters and setters
Google/Service/Mirror.php (class Google_Service_Mirror) --> TODO
Client --> to extend during the service class development