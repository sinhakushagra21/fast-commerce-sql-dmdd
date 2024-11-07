CREATE TABLE "USER18GP"."USERS" 
   (	"USER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"IS_ACTIVE" CHAR(1) COLLATE "USING_NLS_COMP", 
	"CONTACT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	 CHECK (is_active IN ('N', 'Y')) ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
  CREATE UNIQUE INDEX "USER18GP"."USERS_PK" ON "USER18GP"."USERS" ("USER_ID") 
  ;
ALTER TABLE "USER18GP"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX "USER18GP"."USERS_PK"  ENABLE;
