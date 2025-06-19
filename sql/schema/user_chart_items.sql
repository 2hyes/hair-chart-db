-- 디폴트(공통) 항목 ex. 얼굴형 - 계란형, 다이아몬드형, ...
CREATE TABLE chart_item_default_options (
    id SERIAL PRIMARY KEY,
    category_id VARCHAR(50) NOT NULL, -- ex. face_shape
    category_name VARCHAR(50) NOT NULL, -- ex. 얼굴형
    option_name VARCHAR(100) UNIQUE NOT NULL, -- ex. 계란형, 다이아몬드형
    image_source VARCHAR(500)
);

-- 유저별 커스텀 항목 테이블
CREATE TABLE chart_item_user_options (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL, -- ex. face_shape
    category_name VARCHAR(50) NOT NULL, -- ex. 얼굴형
    option_name VARCHAR(100) UNIQUE NOT NULL, -- ex. 계란형, 다이아몬드형
    image_source VARCHAR(500),
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
