google-api-ABAP-client
======================

Google APIs Client Library for ABAP created as copy of the php Library.

Starting with Google Glasses API.

The google-api-php-client-master is the folder with the php implementation to translate.


-------------------
HOW TO CONTRIBUTE
-------------------

1) Use SAPLINK to import the nugget


2) If you want redefine the structure:

ZGOOGLEAPIABAPCLIENT
->ZSRC
|  |_(ZGOOGLE_CLIENT, ZGOOGLE_CONFIG, ZGOOGLE_SERVICE, Dictionary objects, Exception classes)
|
|->SUBPACKAGES*
|
->report ZGOOGLE_TEST

*
SUBPACKAGES:
|
->ZJSONDOCUMENT
   |_(ZCL_JSON_DOCUMENT, ZCX_JSON_DOCUMENT, ZJSON Message class)
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


--------------------------------------
Next steps for collaborators:
--------------------------------------

Implement the parameter management and the postbody management in the ZGOOGLE_RESOURCE include, class google_service_resource, method call.

Adjust the code

Implement the insert method




