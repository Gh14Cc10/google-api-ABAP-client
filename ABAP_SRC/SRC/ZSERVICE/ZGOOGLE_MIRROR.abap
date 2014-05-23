*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_RESOURCE
*&---------------------------------------------------------------------*

INCLUDE zgoogle_service.
INCLUDE zgoogle_rest.
INCLUDE zgoogle_request.

CLASS google_service_resource DEFINITION.

  PUBLIC SECTION.

    METHODS: constructor IMPORTING service TYPE REF TO google_service
                                   servicename TYPE string
                                   resourcename TYPE string
                                   resource TYPE zgoogle_methods_t.

    METHODS: call IMPORTING name TYPE string
                            arguments TYPE string
                            expectedclass TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: po_service TYPE REF TO google_service,
          po_client TYPE REF TO google_client,
          pv_servicename TYPE string,
          pv_resourcename TYPE string,
          pt_resource TYPE zgoogle_methods_t.

ENDCLASS.                    "main DEFINITION

CLASS google_service_resource IMPLEMENTATION.

  METHOD constructor.
    me->po_service = service.
    me->po_client = service->getclient( ).
    me->pv_servicename = servicename.
    me->pv_resourcename = resourcename.
    me->pt_resource = resource.
  ENDMETHOD.

  METHOD call.
    "TODO
    DATA ls_resource TYPE zgoogle_methods_s.
    DATA lv_path TYPE string.
    DATA lv_httpmethod TYPE string.
    DATA lv_parameters TYPE string.

    "MISSING postbody CONSTRUCTION

    "MISSING PARAMETERS CONSTRUCTION

    LOOP AT me->pt_resource INTO ls_resource WHERE method = name.
      lv_path = ls_resource-path.
      lv_httpmethod = ls_resource-httpmethod.
      "ADD PARAM
      "lv_parameters =...
    ENDLOOP.

    DATA lv_servicepath TYPE string.
    lv_servicepath = me->po_service->servicepath.

    DATA lv_url TYPE string.
    lv_url = google_http_rest=>createrequesturi(
                  servicepath = lv_servicepath
                  respath = lv_path
                  params = lv_parameters
    ).

    DATA lo_http_request TYPE REF TO google_http_request.
    CREATE OBJECT lo_http_request
      EXPORTING
        url      = lv_url
        method   = lv_httpmethod
        headers  = ''
        postbody = ''.

    DATA lv_basepath TYPE string.
    lv_basepath = me->po_client->getbasepath( ).
    lo_http_request->setBaseComponent( ip_basepath = lv_basepath ).
    lo_http_request->setExpectedClass( ip_expectedclass = expectedclass ).

*    $httpRequest = $this->client->getAuth()->sign(lo_http_request);

    IF me->po_client->shoulddefer( ) EQ 'X'.
*      // If we are in batch or upload mode, return the raw request.
*      return $httpRequest;
    ENDIF.

*    return $this->client->execute($httpRequest);

  ENDMETHOD.

ENDCLASS.                    "main IMPLEMENTATION