*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_REQUEST
*&---------------------------------------------------------------------*

CLASS google_http_request DEFINITION.

  PUBLIC SECTION.

    METHODS: constructor IMPORTING url TYPE string
                                   method TYPE string
                                   headers TYPE string
                                   postbody TYPE string.

    METHODS setrequestmethod IMPORTING ip_method TYPE string.

    METHODS seturl IMPORTING ip_url TYPE string.

    METHODS setrequestheaders IMPORTING ip_headers TYPE string.

    METHODS setpostbody IMPORTING ip_postbody TYPE string.

    METHODS setbasecomponent IMPORTING ip_basepath TYPE string.

    METHODS setexpectedclass IMPORTING ip_expectedclass TYPE string.

    DATA pv_accesskey TYPE string.

  PROTECTED SECTION.

    DATA: pv_queryparams TYPE string,
          pv_requestmethod TYPE string,
          pv_requestheaders TYPE string,
          pv_basecomponent TYPE string,
          pv_path TYPE string,
          pv_postbody TYPE string,
          pv_useragent TYPE string,
          pv_cangzip TYPE string,
          pv_responsehttpcode TYPE string,
          pv_responseheaders TYPE string,
          pv_responsebody TYPE string,
          pv_expectedclass TYPE string.

ENDCLASS.

CLASS google_http_request IMPLEMENTATION.

  METHOD constructor.

    me->seturl( url ).
    me->setrequestmethod( method ).
    me->setrequestheaders( headers ).
    me->setpostbody( postbody ).

  ENDMETHOD.

  METHOD seturl.
    DATA lv_url TYPE string.
    lv_url = ip_url.
    IF lv_url(4) NE 'http'.
*     Force the path become relative.
      IF lv_url(1) NE '/'.
        CONCATENATE '/' lv_url INTO lv_url.
      ENDIF.
    ENDIF.
*    $parts = parse_url($url);
*    if (isset($parts['host'])) {
*      $this->baseComponent = sprintf(
*          "%s%s%s",
*          isset($parts['scheme']) ? $parts['scheme'] . "://" : '',
*          isset($parts['host']) ? $parts['host'] : '',
*          isset($parts['port']) ? ":" . $parts['port'] : ''
*      );
*    }
    me->pv_path = lv_url.
*    $this->path = isset($parts['path']) ? $parts['path'] : '';
*    $this->queryParams = array();
*    if (isset($parts['query'])) {
*      $this->queryParams = $this->parseQuery($parts['query']);
*    }

  ENDMETHOD.

  METHOD setrequestmethod.
    me->pv_requestmethod = ip_method.
    TRANSLATE me->pv_requestmethod TO UPPER CASE.
  ENDMETHOD.

  METHOD setrequestheaders.
*    $headers = Google_Utils::normalize($headers);
*    if ($this->requestHeaders) {
*      $headers = array_merge($this->requestHeaders, $headers);
*    }
*    $this->requestHeaders = $headers;
  ENDMETHOD.

  METHOD setpostbody.
*    $this->postBody = $postBody;
  ENDMETHOD.

  METHOD setbasecomponent.
    me->pv_basecomponent = ip_basepath.
  ENDMETHOD.

  METHOD setexpectedclass.
    me->pv_expectedclass = ip_expectedclass.
  ENDMETHOD.

ENDCLASS.