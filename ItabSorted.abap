 
*&---------------------------------------------------------------------*
*& Report  ZBC430_04_ITAB_SORTED
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zbc430_04_itab_sorted.

DATA  it_flight TYPE zit_sflight.
DATA  wa_sflight TYPE sflight.

WRITE / 'Lista en Orden la tabla'.

SELECT *
  FROM sflight
  INTO wa_sflight
  WHERE carrid = 'JL'.

  WRITE: /  wa_sflight-carrid,
            wa_sflight-connid,
            wa_sflight-fldate,
            wa_sflight-price,
            wa_sflight-currency,
            wa_sflight-planetype.
ENDSELECT.

ULINE.

WRITE / 'Lista en Ordenada Por Fecha'.

SELECT *
  FROM sflight
  INTO TABLE it_flight
  WHERE carrid = 'JL'.

LOOP AT it_flight INTO wa_sflight.

  WRITE: /  wa_sflight-carrid,
            wa_sflight-connid,
            wa_sflight-fldate,
            wa_sflight-price,
            wa_sflight-currency,
            wa_sflight-planetype.

ENDLOOP. 