BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE "USER18GP"."ORDERS" CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      -- Ignore the error if the table does not exist
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

CREATE TABLE "USER18GP"."ORDERS" 
   (	"ORDER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"ORDER_DATE" TIMESTAMP (0), 
	"ORDER_STATUS_ID" NUMBER, 
	"PAYMENTS_PAYMENT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"USERS_USER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "ORDERS_PAYMENTS_FK" FOREIGN KEY ("PAYMENTS_PAYMENT_ID")
	  REFERENCES "USER18GP"."PAYMENTS" ("PAYMENT_ID") ENABLE, 
	 CONSTRAINT "ORDERS_USERS_FK" FOREIGN KEY ("USERS_USER_ID")
	  REFERENCES "USER18GP"."USERS" ("USER_ID") ENABLE, 
	 CONSTRAINT "ORDERS_STATUS_FK" FOREIGN KEY ("ORDER_STATUS_ID")
	  REFERENCES "USER18GP"."ORDER_STATUSES" ("STATUS_ID") ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
  CREATE UNIQUE INDEX "USER18GP"."ORDERS_PK" ON "USER18GP"."ORDERS" ("ORDER_ID") 
  ;
ALTER TABLE "USER18GP"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX "USER18GP"."ORDERS_PK"  ENABLE;