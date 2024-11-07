CREATE TABLE "USER18GP"."PAYMENT_TYPES" 
   (	"PAYMENT_TYPE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"PAYMENT_TYPE_NAME" VARCHAR2(50) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "PAYMENT_TYPES_PK" PRIMARY KEY ("PAYMENT_TYPE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "PAYMENT_TYPES_PAYMENT_TYPE_NAME_UN" UNIQUE ("PAYMENT_TYPE_NAME")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
