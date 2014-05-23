*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_CONFIG
*&---------------------------------------------------------------------*
INCLUDE zgoogle_client.

*---------------------------------------------------------------------*
*       CLASS main DEFINITION
*---------------------------------------------------------------------*
CLASS google_service DEFINITION.

  PUBLIC SECTION.

    DATA: version TYPE string,
          servicepath TYPE string,
          servicename TYPE string,
          availablescopes TYPE string,
          resource TYPE string.

    METHODS constructor IMPORTING VALUE(io_client) TYPE REF TO google_client.

    METHODS getclient RETURNING VALUE(ro_client) TYPE REF TO google_client.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA po_client TYPE REF TO google_client.

ENDCLASS.                    "main DEFINITION


*---------------------------------------------------------------------*
*       CLASS main IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS google_service IMPLEMENTATION.

  METHOD constructor.
    me->po_client = io_client.
  ENDMETHOD.

  METHOD getclient.
    ro_client = me->po_client.
  ENDMETHOD.


ENDCLASS.                    "main IMPLEMENTATION