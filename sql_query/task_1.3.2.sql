SELECT 
    "bet-id",
    "event-id",
    odd,
    ROUND(
        EXP(SUM(LN(odd)) OVER (PARTITION BY "bet-id"))::numeric, 
        2
    ) AS bet_odd
FROM bet_events_table
ORDER BY "bet-id", "event-id";