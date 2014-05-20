*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_CONFIG
*&---------------------------------------------------------------------*
INCLUDE zgoogle_config.

*---------------------------------------------------------------------*
*       CLASS main DEFINITION
*---------------------------------------------------------------------*
CLASS google_client DEFINITION.

  PUBLIC SECTION.
    CONSTANTS: libver TYPE string VALUE '1.0.5-beta',
               user_agent_suffix TYPE string VALUE 'google-api-ABAP-client/'.

    METHODS constructor.

    METHODS setapplicationname IMPORTING VALUE(ip_value) TYPE string.

    METHODS setdeveloperkey IMPORTING VALUE(ip_value) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

* @var Google_Config $config
    DATA po_config TYPE REF TO google_config.

ENDCLASS.                    "main DEFINITION


*---------------------------------------------------------------------*
*       CLASS main IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS google_client IMPLEMENTATION.

  METHOD constructor.

    CREATE OBJECT po_config.

  ENDMETHOD.                    "set_data

  METHOD setapplicationname.
    po_config->setapplicationname( ip_value = ip_value ).
  ENDMETHOD.

  METHOD setdeveloperkey.
    po_config->setdeveloperkey( ip_value = ip_value ).
  ENDMETHOD.

ENDCLASS.                    "main IMPLEMENTATION