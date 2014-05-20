google-api-ABAP-client
======================

Google APIs Client Library for ABAP created as copy of the php Library.

Starting with Google Glasses API.


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
  
    echo $item['volumeInfo']['title'], "<br /> \n";
    
  }
  
?>


-------------------
ABAP sample code
-------------------

See report ZGOOGLE_TEST



