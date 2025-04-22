-- 고객정보 날짜 / 이름 / ID / 고객번호(전화번호)

CREATE TABLE "public"."users" (
    "seq" SERIAL PRIMARY KEY, 
    "id" VARCHAR(50) UNIQUE NOT NULL, 
    "name" VARCHAR(100) NOT NULL, 
    "password" VARCHAR NOT NULL, 
    "phone_number" VARCHAR(20) UNIQUE,
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    "memo" VARCHAR
)
COMMENT ON COLUMN "public"."users"."seq" IS 'auto_increment sequence';
COMMENT ON COLUMN "public"."users"."id" IS 'user id';
COMMENT ON COLUMN "public"."users"."name" IS 'customer name';
COMMENT ON COLUMN "public"."users"."password" IS 'user password';
COMMENT ON COLUMN "public"."users"."phone_number" IS 'customer phone number';
COMMENT ON COLUMN "public"."users"."created_time" IS 'record creation time';
COMMENT ON COLUMN "public"."users"."updated_time" IS 'record last update time';
COMMENT ON COLUMN "public"."users"."memo" IS 'additional details';
