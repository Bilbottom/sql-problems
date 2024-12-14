use santa_workshop;

/* SantaRecords */
select * from SantaRecords;

------------------------------------------------------------------------
------------------------------------------------------------------------

/* Solution */
from (
    from SantaRecords
    select unnest(cleaning_receipts->'$[*]') as receipt,
)
select max(receipt->>'drop_off')
where (receipt->>'color', receipt->>'garment') = ('green', 'suit')
;