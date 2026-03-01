CREATE TABLE events (
    event_id UUID PRIMARY KEY,
    sport VARCHAR(100),
    category VARCHAR(100),
    event VARCHAR(255)
);

CREATE TABLE bets (
    bet_id UUID,
    player_id UUID,
    accept_time TIMESTAMP,
    create_time TIMESTAMP,
    settlement_time TIMESTAMP,
    result VARCHAR(50),
    amount NUMERIC(15, 4),
    payout NUMERIC(15, 4),
    profit NUMERIC(15, 4),
    bet_type VARCHAR(50),
    bet_size INT,
    accepted_bet_odd NUMERIC(15, 4),
    item_result VARCHAR(50),
    event_stage VARCHAR(50),
    accepted_odd NUMERIC(15, 4),
    item_amount NUMERIC(15, 4),
    item_payout NUMERIC(15, 4),
    item_profit NUMERIC(15, 4),
    event_id UUID,
    is_free_bet BOOLEAN,
    settlement_status VARCHAR(50)
);

COPY events FROM '/data/events.csv' DELIMITER ',' CSV HEADER;
COPY bets FROM '/data/bets.csv' DELIMITER ',' CSV HEADER;