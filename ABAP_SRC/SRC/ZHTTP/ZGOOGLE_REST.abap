*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_REST
*&---------------------------------------------------------------------*
CLASS google_http_rest DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS: createrequesturi IMPORTING servicepath TYPE string
                                              respath TYPE string
                                              params TYPE string
                                    RETURNING VALUE(ep_value) TYPE string.

ENDCLASS.

CLASS google_http_rest IMPLEMENTATION.

  METHOD createrequesturi.

    DATA lv_requesturl TYPE string.
    CONCATENATE servicepath respath INTO lv_requesturl.
*    $uriTemplateVars = array();
*    $queryVars = array();
*    foreach ($params as $paramName => $paramSpec) {
*      if ($paramSpec['type'] == 'boolean') {
*        $paramSpec['value'] = ($paramSpec['value']) ? 'true' : 'false';
*      }
*      if ($paramSpec['location'] == 'path') {
*        $uriTemplateVars[$paramName] = $paramSpec['value'];
*      } else if ($paramSpec['location'] == 'query') {
*        if (isset($paramSpec['repeated']) && is_array($paramSpec['value'])) {
*          foreach ($paramSpec['value'] as $value) {
*            $queryVars[] = $paramName . '=' . rawurlencode($value);
*          }
*        } else {
*          $queryVars[] = $paramName . '=' . rawurlencode($paramSpec['value']);
*        }
*      }
*    if (count($uriTemplateVars)) {
*      $uriTemplateParser = new Google_Utils_URITemplate();
*      $requestUrl = $uriTemplateParser->parse($requestUrl, $uriTemplateVars);
*    }
*
*    if (count($queryVars)) {
*      $requestUrl .= '?' . implode($queryVars, '&');
*    }
*
    ep_value = lv_requesturl.

  ENDMETHOD.

ENDCLASS.