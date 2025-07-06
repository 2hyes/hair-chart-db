-- 디폴트(공통) 항목 ex. 얼굴형 - 계란형, 다이아몬드형, ...
CREATE TABLE chart_item_default_options (
    id VARCHAR(100) PRIMARY KEY, -- default + seq 형태 (예: default_face_shape_001)
    category_id VARCHAR(50) NOT NULL, -- ex. face_shape
    category_name VARCHAR(50) NOT NULL, -- ex. 얼굴형
    option_name VARCHAR(100) NOT NULL, -- ex. 계란형, 다이아몬드형
    image_source VARCHAR(500)
);
CREATE UNIQUE INDEX uq_category_option ON public.chart_item_default_options USING btree (category_id, option_name);


-- 사용자별 카테고리별 시퀀스 관리 테이블
CREATE TABLE user_category_sequence (
    user_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    current_seq INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id, category_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 유저별 커스텀 항목 테이블
CREATE TABLE chart_item_user_options (
    id VARCHAR(100) PRIMARY KEY, -- userId + seq 형태 (예: user123_face_shape_001)
    user_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL, -- ex. face_shape
    category_name VARCHAR(50) NOT NULL, -- ex. 얼굴형
    option_name VARCHAR(100) NOT NULL, -- ex. 계란형, 다이아몬드형
    image_source VARCHAR(500),
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX uq_user_category_option ON public.chart_item_user_options USING btree (user_id, category_id, option_name);



-- 시퀀스 생성을 위한 함수
CREATE OR REPLACE FUNCTION generate_user_option_id()
RETURNS TRIGGER AS $$
DECLARE
    next_seq INTEGER;
BEGIN
    -- 시퀀스 테이블에서 현재 시퀀스 값을 가져오거나 새로 생성
    INSERT INTO user_category_sequence (user_id, category_id, current_seq)
    VALUES (NEW.user_id, NEW.category_id, 1)
    ON CONFLICT (user_id, category_id)
    DO UPDATE SET current_seq = user_category_sequence.current_seq + 1
    RETURNING current_seq INTO next_seq;
    
    -- ID 생성: userId_categoryId_seq 형태
    NEW.id := NEW.user_id || '_' || NEW.category_id || '_' || LPAD(next_seq::TEXT, 3, '0');
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 트리거 생성
CREATE TRIGGER trigger_generate_user_option_id
    BEFORE INSERT ON chart_item_user_options
    FOR EACH ROW
    EXECUTE FUNCTION generate_user_option_id();
