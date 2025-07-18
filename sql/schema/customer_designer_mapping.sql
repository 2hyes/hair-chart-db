-- 고객-디자이너 매핑 테이블 (N:M 관계)

CREATE TABLE customer_designer_mapping (
    id SERIAL PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL, -- users.id (user_type=customer)
    designer_id VARCHAR(50) NOT NULL, -- users.id (user_type=designer)
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- 요청 상태: pending, accepted, rejected
    requested_by VARCHAR(50) NOT NULL, -- 요청자 (디자이너)
    requested_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    responded_time TIMESTAMP,          -- 고객이 수락/거절한 시간
    memo  VARCHAR(4000),                        -- 비고/메모
    
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_designer FOREIGN KEY (designer_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 인덱스: 한 고객-디자이너 쌍은 중복 불가
CREATE UNIQUE INDEX uq_customer_designer ON customer_designer_mapping (customer_id, designer_id);
