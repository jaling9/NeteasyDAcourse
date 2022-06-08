select 
	from_unixtime(log_time,'%y-%m-%d') as dt,
    count(distinct device_id) uv,
    sum(1),
    sum(duration)/count(distinct device_id)  as duration_per_uv
from user_play_detail
group by 1s