INCLUDE zgoogle_resource.

CLASS google_service_mirror_tl_rss DEFINITION INHERITING FROM google_service_resource.

  PUBLIC SECTION.

    METHODS listtimeline EXPORTING VALUE(et_results) TYPE t_string.

ENDCLASS.

CLASS google_service_mirror_tl_rss IMPLEMENTATION.

  METHOD listtimeline.
    me->call( name = 'list'
              arguments = ''
              expectedclass = 'Google_Service_Mirror_TimelineListResponse').
  ENDMETHOD.

ENDCLASS.

CLASS google_service_mirror DEFINITION INHERITING FROM google_service.

  PUBLIC SECTION.

* View your location.
    CONSTANTS: glass_location TYPE string VALUE 'https://www.googleapis.com/auth/glass.location',
* View and manage your Glass timeline.
               glass_timeline TYPE string VALUE 'https://www.googleapis.com/auth/glass.timeline'.

    DATA: accounts TYPE string,
          contacts TYPE string,
          locations TYPE string,
          settings TYPE string,
          subscriptions TYPE string,
          timeline TYPE REF TO google_service_mirror_tl_rss,
          timeline_attachments TYPE string.

    METHODS constructor IMPORTING VALUE(io_client) TYPE REF TO google_client.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS google_service_mirror IMPLEMENTATION.

  METHOD constructor.
    super->constructor( io_client ).
    me->servicepath = 'mirror/v1/'.
    me->version = 'v1'.
    me->servicename = 'mirror'.

    DATA ls_resource TYPE zgoogle_methods_s.
    DATA lt_resource TYPE zgoogle_methods_t.

    ls_resource-method = 'delete'.
    ls_resource-path = 'timeline/{id}'.
    ls_resource-httpmethod = 'DELETE'.
    ls_resource-param = 'id'.
    ls_resource-location = 'path'.
    ls_resource-type = 'string'.
    ls_resource-required = 'X'.
    APPEND ls_resource TO lt_resource.

    ls_resource-method = 'get'.
    ls_resource-path = 'timeline/{id}'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'id'.
    ls_resource-location = 'path'.
    ls_resource-type = 'string'.
    ls_resource-required = 'X'.
    APPEND ls_resource TO lt_resource.

    ls_resource-method = 'insert'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'POST'.
    ls_resource-param = ''.
    ls_resource-location = ''.
    ls_resource-type = 'array'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.

    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'orderBy'.
    ls_resource-location = 'query'.
    ls_resource-type = 'string'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'includeDeleted'.
    ls_resource-location = 'query'.
    ls_resource-type = 'boolean'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'maxResults'.
    ls_resource-location = 'query'.
    ls_resource-type = 'integer'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'pageToken'.
    ls_resource-location = 'query'.
    ls_resource-type = 'string'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'sourceItemId'.
    ls_resource-location = 'query'.
    ls_resource-type = 'string'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'pinnedOnly'.
    ls_resource-location = 'query'.
    ls_resource-type = 'boolean'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.
    ls_resource-method = 'list'.
    ls_resource-path = 'timeline'.
    ls_resource-httpmethod = 'GET'.
    ls_resource-param = 'bundleId'.
    ls_resource-location = 'query'.
    ls_resource-type = 'string'.
    ls_resource-required = ''.
    APPEND ls_resource TO lt_resource.

    ls_resource-method = 'patch'.
    ls_resource-path = 'timeline/{id}'.
    ls_resource-httpmethod = 'PATCH'.
    ls_resource-param = 'id'.
    ls_resource-location = 'path'.
    ls_resource-type = 'string'.
    ls_resource-required = 'X'.
    APPEND ls_resource TO lt_resource.

    ls_resource-method = 'update'.
    ls_resource-path = 'timeline/{id}'.
    ls_resource-httpmethod = 'PUT'.
    ls_resource-param = 'id'.
    ls_resource-location = 'path'.
    ls_resource-type = 'string'.
    ls_resource-required = 'X'.
    APPEND ls_resource TO lt_resource.

    CREATE OBJECT timeline
      EXPORTING
        service      = me
        servicename  = me->servicename
        resourcename = 'timeline'
        resource     = lt_resource.

  ENDMETHOD.

ENDCLASS.