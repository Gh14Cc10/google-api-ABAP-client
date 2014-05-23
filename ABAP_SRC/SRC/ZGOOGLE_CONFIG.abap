*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_CONFIG
*&---------------------------------------------------------------------*
INCLUDE zgoogle_types.

*---------------------------------------------------------------------*
*       CLASS main DEFINITION
*---------------------------------------------------------------------*
CLASS google_config DEFINITION.

  PUBLIC SECTION.

    CONSTANTS: gzip_disabled TYPE zgoogle_bool VALUE abap_true,
               gzip_enabled TYPE zgoogle_bool VALUE abap_false,
               gzip_uploads_enabled TYPE zgoogle_bool VALUE abap_true,
               zip_uploads_disabled TYPE zgoogle_bool VALUE abap_false,
               use_auto_io_selection TYPE string VALUE 'auto'.

    METHODS constructor.

    "Getters
    METHODS getclassconfig IMPORTING VALUE(ip_class) TYPE string
                                     VALUE(ip_key) TYPE string
                           RETURNING VALUE(et_config) TYPE zgoogle_kcv_t.

    METHODS getcacheclass RETURNING VALUE(ep_value) TYPE string.

    METHODS getauthclass RETURNING VALUE(ep_value) TYPE string.

    METHODS getioclass RETURNING VALUE(ep_value) TYPE string.

    METHODS getapplicationname RETURNING VALUE(ep_value) TYPE string.

    METHODS getbasepath RETURNING VALUE(ep_value) TYPE string.

    "Setters
    METHODS setclassconfig IMPORTING VALUE(ip_class) TYPE string
                                     VALUE(it_config) TYPE zgoogle_kcv_t
                                     VALUE(ip_value) TYPE string.

    METHODS setauthclass IMPORTING VALUE(ip_class) TYPE string.

    METHODS setioclass IMPORTING VALUE(ip_class) TYPE string.

    METHODS setcacheclass IMPORTING VALUE(ip_class) TYPE string.

    METHODS setapplicationname IMPORTING VALUE(ip_value) TYPE string.

    METHODS setclientid IMPORTING VALUE(ip_value) TYPE string.

    METHODS setredirecturi IMPORTING VALUE(ip_value) TYPE string.

    METHODS setrequestvisibleactions IMPORTING VALUE(ip_value) TYPE string.

    METHODS setaccesstype IMPORTING VALUE(ip_value) TYPE string.

    METHODS setapprovalprompt IMPORTING VALUE(ip_value) TYPE string.

    METHODS setdeveloperkey IMPORTING VALUE(ip_value) TYPE string.

    METHODS setauthconfig IMPORTING VALUE(ip_key) TYPE string
                                    VALUE(ip_value) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: configuration TYPE zgoogle_kcv_t.

ENDCLASS.                    "main DEFINITION


*---------------------------------------------------------------------*
*       CLASS main IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS google_config IMPLEMENTATION.

  METHOD constructor.

    DATA ls_configuration   TYPE zgoogle_kcv_s.

*   The application_name is included in the User-Agent HTTP header.
    ls_configuration-vkey = 'application_name'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.

*   Which Authentication, Storage and HTTP IO classes to use.
    ls_configuration-vkey = 'auth_class'.
    ls_configuration-vvalue = 'google_guth_oauth2'.
    APPEND ls_configuration TO me->configuration.
    ls_configuration-vkey = 'io_class'.
    ls_configuration-vvalue = me->use_auto_io_selection.
    APPEND ls_configuration TO me->configuration.
    ls_configuration-vkey = 'cache_class'.
    ls_configuration-vvalue = 'google_cache_file'.
    APPEND ls_configuration TO me->configuration.

*   Don't change these unless you're working against a special development
*   or testing environment.
    ls_configuration-vkey = 'base_path'.
    ls_configuration-vvalue = 'https://www.googleapis.com'.
    APPEND ls_configuration TO me->configuration.

*   Definition of class specific values, like file paths and so on.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_io_abstract'.
    ls_configuration-vkey = 'request_timeout_seconds'.
    ls_configuration-vvalue = '100'.
    APPEND ls_configuration TO me->configuration.

*   Disable the use of gzip on calls if set to true. Defaults to false.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_http_request'.
    ls_configuration-vkey = 'disable_gzip'.
    ls_configuration-vvalue = me->gzip_enabled.
    APPEND ls_configuration TO me->configuration.

*   We default gzip to disabled on uploads even if gzip is otherwise
*   enabled, due to some issues seen with small packet sizes for uploads.
*   Please test with this option before enabling gzip for uploads in
*   a production environment.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_http_request'.
    ls_configuration-vkey = 'enable_gzip_for_uploads'.
    ls_configuration-vvalue = me->zip_uploads_disabled.
    APPEND ls_configuration TO me->configuration.


*   If you want to pass in OAuth 2.0 settings, they will need to be
*   structured like this.

*   Keys for OAuth 2.0 access, see the API console at
*   https://developers.google.com/console
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'client_id'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'client_secret'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'redirect_uri'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.

*   Simple API access key, also from the API console. Ensure you get
*   a Server key, and not a Browser key.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'developer_key'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.

*   Other parameters.
    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'access_type'.
    ls_configuration-vvalue = 'online'.
    APPEND ls_configuration TO me->configuration.

    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'approval_prompt'.
    ls_configuration-vvalue = 'auto'.
    APPEND ls_configuration TO me->configuration.

    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'request_visible_actions'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.

    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_auth_oauth2'.
    ls_configuration-vkey = 'federated_signon_certs_url'.
    ls_configuration-vvalue = 'https://www.googleapis.com/oauth2/v1/certs'.
    APPEND ls_configuration TO me->configuration.

    ls_configuration-vcategory = 'classes'.
    ls_configuration-vclass = 'google_cache_file'.
    ls_configuration-vkey = 'directory'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.


*   Definition of service specific values like scopes, oauth token URLs,
*   etc. Example:
    ls_configuration-vcategory = 'services'.
    ls_configuration-vvalue = ''.
    APPEND ls_configuration TO me->configuration.

  ENDMETHOD.                    "set_data

  "Getters
  METHOD getclassconfig.

    DATA: ls_configuration TYPE zgoogle_kcv_s.

    LOOP AT me->configuration INTO ls_configuration.
      IF ip_key IS INITIAL.
        IF ls_configuration-vcategory = 'classes' AND ls_configuration-vclass = ip_class.
          APPEND ls_configuration TO et_config.
          CLEAR ls_configuration.
        ENDIF.
      ELSE.
        IF ls_configuration-vcategory = 'classes' AND ls_configuration-vclass = ip_class
                                                  AND ls_configuration-vkey = ip_key.
          APPEND ls_configuration TO et_config.
          CLEAR ls_configuration.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD getcacheclass.
* Return the configured cache class.
* @return string
    DATA: ls_configuration TYPE zgoogle_kcv_s.
    READ TABLE me->configuration INTO ls_configuration WITH KEY vkey = 'cache_class'.
    MOVE ls_configuration-vvalue TO ep_value.
  ENDMETHOD.

  METHOD getauthclass.
* Return the configured Auth class.
* @return string
    DATA: ls_configuration TYPE zgoogle_kcv_s.
    READ TABLE me->configuration INTO ls_configuration WITH KEY vkey = 'auth_class'.
    MOVE ls_configuration-vvalue TO ep_value.
  ENDMETHOD.

  METHOD getioclass.
* Return the configured IO class.
* @return string
    DATA: ls_configuration TYPE zgoogle_kcv_s.
    READ TABLE me->configuration INTO ls_configuration WITH KEY vkey = 'io_class'.
    MOVE ls_configuration-vvalue TO ep_value.
  ENDMETHOD.

  METHOD getapplicationname.
* @return string the name of the application
    DATA: ls_configuration TYPE zgoogle_kcv_s.
    READ TABLE me->configuration INTO ls_configuration WITH KEY vkey = 'application_name'.
    MOVE ls_configuration-vvalue TO ep_value.
  ENDMETHOD.

  METHOD getbasepath.
* @return string the base URL to use for API calls
    DATA: ls_configuration TYPE zgoogle_kcv_s.
    READ TABLE me->configuration INTO ls_configuration WITH KEY vkey = 'base_path'.
    MOVE ls_configuration-vvalue TO ep_value.
  ENDMETHOD.

  "Setters
  METHOD setclassconfig.
  ENDMETHOD.

  METHOD setauthclass.
  ENDMETHOD.

  METHOD setioclass.
  ENDMETHOD.

  METHOD setcacheclass.
  ENDMETHOD.

  METHOD setapplicationname.
  ENDMETHOD.

  METHOD setclientid.
  ENDMETHOD.

  METHOD setredirecturi.
  ENDMETHOD.

  METHOD setrequestvisibleactions.
  ENDMETHOD.

  METHOD setaccesstype.
  ENDMETHOD.

  METHOD setapprovalprompt.
  ENDMETHOD.

  METHOD setdeveloperkey.
  ENDMETHOD.

  METHOD setauthconfig.
  ENDMETHOD.


ENDCLASS.                    "main IMPLEMENTATION