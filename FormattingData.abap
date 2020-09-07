*&---------------------------------------------------------------------*
*& Report  Z_DEMO_FORM_DATA_ON_READ
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_DEMO_FORM_DATA_ON_READ.

DATA: SUM TYPE I, CNT TYPE I,
      WA_SPFLI TYPE SPFLI,
      WA_SFLIGHT TYPE SFLIGHT,
      WA_SBOOK TYPE SBOOK.

SELECT * FROM SPFLI INTO WA_SPFLI
                    ORDER BY CITYFROM CITYTO CONNID.

  SKIP.
  WRITE: / WA_SPFLI-CARRID,
           WA_SPFLI-CONNID,
           'from', (15) WA_SPFLI-CITYFROM,
           'to',   (15) WA_SPFLI-CITYTO.
  ULINE.

  SELECT * FROM SFLIGHT INTO WA_SFLIGHT
                        WHERE CARRID = WA_SPFLI-CARRID
                          AND CONNID = WA_SPFLI-CONNID
                        ORDER BY FLDATE.

    SKIP.
    WRITE: / 'Date:', WA_SFLIGHT-FLDATE.
    WRITE: 20 'Book-ID', 40 'Smoker', 50 'Class'.
    ULINE.

    SUM = 0.
    CNT = 0.
    SELECT * FROM SBOOK INTO WA_SBOOK
                        WHERE CARRID = WA_SFLIGHT-CARRID
                          AND CONNID = WA_SFLIGHT-CONNID
                          AND FLDATE = WA_SFLIGHT-FLDATE
                        ORDER BY CLASS SMOKER BOOKID.

      WRITE: / WA_SBOOK-BOOKID UNDER 'Book-ID',
               WA_SBOOK-SMOKER UNDER 'Smoker',
               WA_SBOOK-CLASS  UNDER 'Class'.

      SUM = SUM + WA_SBOOK-LUGGWEIGHT.
      CNT = CNT + 1.

    ENDSELECT.

    ULINE.
    WRITE: 'Number of bookings:  ', (3) CNT,
         / 'Total luggage weight:', (3) SUM, WA_SBOOK-WUNIT.

  ENDSELECT.

ENDSELECT.