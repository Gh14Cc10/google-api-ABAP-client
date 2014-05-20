*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_TYPES
*&---------------------------------------------------------------------*
TYPES: BEGIN OF zgoogle_kcv_s,
                  vcategory TYPE string,
                  vclass TYPE string,
                  vkey TYPE string,
                  vvalue TYPE string,
       END OF zgoogle_kcv_s.
TYPES: zgoogle_kcv_t TYPE STANDARD TABLE OF zgoogle_kcv_s WITH KEY vcategory vclass vkey.
TYPES: zgoogle_bool TYPE c LENGTH 1.