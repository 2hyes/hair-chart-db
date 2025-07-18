-- 디자이너 정보
-- 디자이너 고유 ID / 디자이너 이름 / 디자이너 전화번호 / 생성일시 / 수정일시

CREATE TABLE  "public"."designers" (
    seq SERIAL PRIMARY KEY, 
    id VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    belonging_shop_id VARCHAR(50), -- 소속 샵
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    memo VARCHAR(4000),
    FOREIGN KEY (id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (belonging_shop_id) REFERENCES shops(id)
);

COMMENT ON COLUMN designers.seq IS 'designers 테이블의 고유 시퀀스';
COMMENT ON COLUMN designers.id IS '디자이너 고유 id';
COMMENT ON COLUMN designers.name IS '디자이너 이름';
COMMENT ON COLUMN designers.is_active IS '디자이너 활성화 여부';
COMMENT ON COLUMN designers.belonging_shop_id IS '소속된 샵의 id';
COMMENT ON COLUMN designers.created_time IS '생성일시';
COMMENT ON COLUMN designers.updated_time IS '수정일시';
COMMENT ON COLUMN designers.memo IS '메모';

-- updated_time 자동 갱신 트리거
CREATE TRIGGER before_update_designers
    BEFORE UPDATE ON designers
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_time();
