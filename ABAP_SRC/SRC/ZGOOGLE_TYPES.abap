*&---------------------------------------------------------------------*
*&  Include           ZGOOGLE_TYPES
*&---------------------------------------------------------------------*
TYPES: zgoogle_bool TYPE c LENGTH 1.
TYPES: t_string TYPE STANDARD TABLE OF string.
TYPES: BEGIN OF zgoogle_kcv_s,
                  vcategory TYPE string,
                  vclass TYPE string,
                  vkey TYPE string,
                  vvalue TYPE string,
       END OF zgoogle_kcv_s.
TYPES: BEGIN OF zgoogle_methods_s,
                  method TYPE string,
                  path TYPE string,
                  httpmethod TYPE string,
                  param TYPE string,
                  location TYPE string,
                  type TYPE string,
                  required TYPE zgoogle_bool,
       END OF zgoogle_methods_s.
TYPES: zgoogle_kcv_t TYPE STANDARD TABLE OF zgoogle_kcv_s WITH KEY vcategory vclass vkey.
TYPES: zgoogle_methods_t TYPE STANDARD TABLE OF zgoogle_methods_s WITH KEY method.