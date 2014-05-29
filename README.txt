google-api-ABAP-client
======================

Google APIs Client Library for ABAP created as copy of the php Library.

Starting with Google Glasses API.

The google-api-php-client-master is the folder with the php implementation to translate.


-------------------
HOT TO CONTRIBUTE
-------------------

1) Use SAPLINK to import the nugget


2) If you want redefine the structure:

ZGOOGLEAPIABAPCLIENT
->ZSRC
|  |_(ZGOOGLE_CLIENT, ZGOOGLE_CONFIG, ZGOOGLE_SERVICE, Dictionary objects)
|
|->SUBPACKAGES*
|
->report ZGOOGLE_TEST

*
SUBPACKAGES:
|
->ZAUTH
   |_(ZOOGLE_AUTH_OAUTH2)
|
->ZHTTP
   |_(ZGOOGLE_HTTP_REQUEST, ZGOOGLE_HTTP_REST)
|
->ZIO
   |_(ZOOGLE_IO_GENERIC)
|
->ZSERVICE
   |_(ZGOOGLE_SERVICE_MIRROR, ZGOOGLE_SERVICE_MIRROR_TL_RSS, ZGOOGLE_SERVICE_RESOURCE)
|


--------------------------------------
Next steps for collaborators:
--------------------------------------

Implement method AUTHENTICATE in class ZGOOGLE_AUTH_OAUTH2

Implement 
$httpRequest = $this->client->getAuth()->sign(lo_http_request);
and
return $this->client->execute($httpRequest);
in the class ZGOOGLE_SERVICE_RESOURCE, method call.

Implement the parameter management and the postbody management in the ZGOOGLE_RESOURCE include, class google_service_resource, method call.




