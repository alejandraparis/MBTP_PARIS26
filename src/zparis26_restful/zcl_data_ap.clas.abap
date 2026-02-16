CLASS zcl_data_ap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATA_AP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel   TYPE TABLE OF ztb_travel_m_ap,
          lt_booking  TYPE TABLE OF ztb_booking_m_ap,
          lt_book_sup TYPE TABLE OF ztb_booksup_m_ap.
    SELECT travel_id, agency_id, customer_id, begin_date,
   end_date,
    booking_fee, total_price, currency_code, description,
    status AS overall_status, createdby AS created_by,
    createdat AS created_at, lastchangedby AS
   last_changed_by,
    lastchangedat AS last_changed_at
    FROM /dmo/travel INTO CORRESPONDING FIELDS OF TABLE
   @lt_travel
    UP TO 15 ROWS.
    SELECT * FROM /dmo/booking INTO CORRESPONDING FIELDS OF
   TABLE @lt_booking.
    SELECT * FROM /dmo/book_suppl INTO CORRESPONDING FIELDS OF
   TABLE @lt_book_sup.

    DELETE FROM: ztb_travel_m_ap,
                 ztb_booking_m_ap,
                 ztb_booksup_m_ap.

    INSERT:
    ztb_travel_m_ap FROM TABLE @lt_travel,
    ztb_booking_m_ap FROM TABLE @lt_booking,
    ztb_booksup_m_ap FROM TABLE @lt_book_sup.
    out->write( sy-dbcnt ).
    out->write( 'DONE!' ).


  ENDMETHOD.
ENDCLASS.
