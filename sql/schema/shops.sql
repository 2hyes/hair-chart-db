-- 샵 정보
-- 샵 고유 ID / 샵 이름 / 샵 전화번호 / 사업자등록번호 / 생성일시 / 수정일시

CREATE TABLE  "public"."shops" (
    seq SERIAL PRIMARY KEY, 
    id VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    number VARCHAR(20) NOT NULL,
    biz_number VARCHAR(20) NOT NULL,
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    FOREIGN KEY (id) REFERENCES users(id) ON DELETE CASCADE
);

COMMENT ON COLUMN shops.seq IS 'shops테이블의 고유 시퀀스';
COMMENT ON COLUMN shops.id IS '샵 고유 ID';
COMMENT ON COLUMN shops.name IS '샵 이름';
COMMENT ON COLUMN shops.number IS '샵 전화번호';
COMMENT ON COLUMN shops.biz_number IS '사업자등록번호';
COMMENT ON COLUMN shops.created_time IS '생성일시';
COMMENT ON COLUMN shops.updated_time IS '수정일시';

-- updated_time 자동 갱신 트리거
CREATE TRIGGER before_update_shops
    BEFORE UPDATE ON shops
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_time();
