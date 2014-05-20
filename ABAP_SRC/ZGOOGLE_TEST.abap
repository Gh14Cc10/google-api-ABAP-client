*&---------------------------------------------------------------------*
*& Report  ZGOOGLE_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zgoogle_test.

INCLUDE zgoogle_client.
*INCLUDE zgoogle_mirror. "-> TO IMPLEMENT

DATA lo_client TYPE REF TO google_client.
*DATA lo_service TYPE REF TO google_service_mirror. "-> TO IMPLEMENT
*DATA lt_results TYPE boh. "-> TO IMPLEMENT
*DATA ls_results TYPE LINE OF lt_results. "-> TO IMPLEMENT

START-OF-SELECTION.


  CREATE OBJECT lo_client.

  lo_client->setapplicationname( 'Client_Mirror_Examples' ).
  lo_client->setdeveloperkey( 'YOUR_APP_KEY' ).

*CREATE OBJECT lo_service EXPORTING lo_client. "-> TO IMPLEMENT
*lt_results = lo_service->timeline->listTimeline(). "-> TO IMPLEMENT

*loop at lt_results into ls_result. "-> TO IMPLEMENT
*endloop. "-> TO IMPLEMENT