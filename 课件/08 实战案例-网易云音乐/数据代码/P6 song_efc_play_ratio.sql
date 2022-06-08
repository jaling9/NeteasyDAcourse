select
	dt,
    a.songid,
    sum( if( a.duration >= 0.5 * b.duration, 1, 0) )/sum(1) efc_ratio,
    sum(1) cnt
from
(
    SELECT 
		song_id as songid, 
        duration,
        dt
	FROM user_play_detail_clean
)a
 join
(
	select
		songid,
        duration
    from track_duration
)b on a.songid = b.songid
group by 1,2
order by cnt desc