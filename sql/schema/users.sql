-- 유저 정보
-- 샵 매니저 / 디자이너 / 일반 고객

CREATE TABLE "public"."users" (
    "seq" SERIAL PRIMARY KEY, 
    "id" VARCHAR(50) UNIQUE NOT NULL, 
    "user_type" VARCHAR(10) NOT NULL,
    "name" VARCHAR(100) NOT NULL, 
    "hashed_password" VARCHAR NOT NULL, 
    "phone_number" VARCHAR(20) UNIQUE,
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);

COMMENT ON COLUMN "public"."users"."seq" IS 'users 테이블의 고유 시퀀스';
COMMENT ON COLUMN "public"."users"."id" IS '사용자 고유 ID';
COMMENT ON COLUMN "public"."users"."user_type" IS 'shop, designer, customer';
COMMENT ON COLUMN "public"."users"."name" IS '사용자 이름';
COMMENT ON COLUMN "public"."users"."hashed_password" IS '사용자 비밀번호';
COMMENT ON COLUMN "public"."users"."phone_number" IS '휴대폰 번호';
COMMENT ON COLUMN "public"."users"."created_time" IS '생성 시간';
COMMENT ON COLUMN "public"."users"."updated_time" IS '최종 수정 시간';

