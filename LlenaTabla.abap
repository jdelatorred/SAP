*&---------------------------------------------------------------------*
*& Report  ZLLENA_TABLA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZLLENA_TABLA_04.

tables: sflight04.

data: it_sflight04 type table of sflight.

select *
  from sflight
 into table it_sflight04.

insert sflight04 from table it_sflight04. 