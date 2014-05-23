*&---------------------------------------------------------------------*
*& Report  ZGOOGLE_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zgoogle_test.

INCLUDE zgoogle_mirror.

DATA lo_client TYPE REF TO google_client.
DATA lo_service TYPE REF TO google_service_mirror.
DATA lt_results TYPE TABLE OF string. "-> TO IMPLEMENT
DATA ls_results TYPE string. "-> TO IMPLEMENT

START-OF-SELECTION.


  CREATE OBJECT lo_client.

  lo_client->setapplicationname( 'Client_Mirror_Examples' ).
  lo_client->setdeveloperkey( 'YOUR_APP_KEY' ).

CREATE OBJECT lo_service EXPORTING io_client = lo_client.
lo_service->timeline->listTimeline( IMPORTING et_results = lt_results ). "-> TO IMPLEMENT

loop at lt_results into ls_results.
endloop.