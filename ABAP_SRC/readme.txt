Structure:

ZGOOGLEAPIABAPCLIENT
|
->ZHTTP
   |_includes (ZGOOGLE_REQUEST, ZGOOGLE_REST)
|
->ZSERVICE
   |_includes (ZGOOGLE_MIRROR, ZGOOGLE_RESOURCE)
|
->ZSRC
|  |_includes (ZGOOGLE_CLIENT, ZGOOGLE_CONFIG, ZGOOGLE_TYPES, ZGOOGLE_SERVICE)
|
->ZGOOGLE_TEST


--------------------------------------
Next steps for collaborators:
--------------------------------------

Config --> to terminate getters and setters

Implement 
$httpRequest = $this->client->getAuth()->sign(lo_http_request);
and
return $this->client->execute($httpRequest);
in the ZGOOGLE_RESOURCE include, class google_service_resource, method call.

Implement the parameter management and the postbody management in the ZGOOGLE_RESOURCE include, class google_service_resource, method call.
