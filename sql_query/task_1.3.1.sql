SELECT DISTINCT player_id 
FROM (
    SELECT b.player_id 
    FROM bets b
    JOIN events e ON e.event_id = b.event_id
    WHERE
        b.accept_time >= '2022-03-14 12:00:00' 
        AND b.settlement_time <= '2022-03-15 12:00:00'
        AND b.amount >= 10
        AND b.bet_type != 'System'
        AND b.result NOT IN ('Cashout', 'Return')
        AND b.is_free_bet = FALSE
    GROUP BY 
        b.bet_id, 
        b.player_id
    HAVING 
        COUNT(CASE WHEN b.event_stage != 'Prematch' THEN 1 END) = 0
        AND COUNT(CASE WHEN e.sport != 'E-Sports' THEN 1 END) = 0
        AND MIN(b.accepted_odd) >= 1.5
) AS subquery;