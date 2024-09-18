create database sky_sports;
use sky_sports;
show tables;


SELECT distinct(team)
FROM team_group_statistics;


select team 
from team_group_statistics 
where `rank`=1 and `group`=7;


select count(team) 
from team_group_statistics;


select team, matches_played 
from team_group_statistics;


select team, 100.0*(wins/matches_played) as wins_percent 
from team_group_statistics;


SELECT team, goals_scored 
FROM team_group_statistics
WHERE goals_scored = (SELECT MAX(goals_scored) FROM team_group_statistics);


select team, round(100.0*(draws/matches_played), 2) 
from team_group_statistics;


SELECT team, goals_scored 
FROM team_group_statistics 
WHERE goals_scored = (SELECT min(goals_scored) FROM team_group_statistics);


select team, 100.0*(losses/matches_played) as losses_percent 
from team_group_statistics 
order by losses_percent;


select avg(goal_difference) 
from team_group_statistics;


select team, points 
from team_group_statistics 
where points=0;


select * 
from team_group_statistics 
where expected_goal_scored < exp_goal_conceded;


select * 
from team_group_statistics 
where exp_goal_difference between -0.5 and 0.5;


select * 
from team_group_statistics 
order by exp_goal_difference_per_90 asc;


select team, players_used 
from fifa_wc_overview 
where players_used = (SELECT max(players_used) FROM fifa_wc_overview);


select team, avg_age 
from fifa_wc_overview 
order by avg_age;


select avg(possession) 
from fifa_wc_overview;


select team, games 
from fifa_wc_overview 
where games>=5;


select * 
from fifa_wc_overview 
where minutes>600;


select team, goals, assists 
from fifa_wc_overview 
order by goals;


select team, pens_made, pens_att 
from fifa_wc_overview 
order by pens_made desc;


select team, cards_yellow, cards_red 
from fifa_wc_overview 
where cards_red=1 
order by cards_yellow;


select team, goals_per90, assists_per90, goals_assists_per90 
from fifa_wc_overview 
order by goals_assists_per90 desc;


select team, goals_pens_per90, goals_assists_pens_per90 
from fifa_wc_overview 
order by goals_assists_pens_per90;


select  team, shots, shots_on_target, shots_on_target_pct 
from fifa_wc_overview 
where shots_on_target_pct<30 
order by shots_on_target_pct;


select team, shots_per90, shots_on_target_per90 
from fifa_wc_overview 
where team='Belgium';


select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance 
from fifa_wc_overview 
order by average_shot_distance desc;


select team, errors, touches  
from fifa_wc_overview 
where errors=0 and touches<1500;
 
 
 
select team, fouls 
from fifa_wc_overview 
where fouls=(select max(fouls) from fifa_wc_overview);


select team, offsides 
from fifa_wc_overview 
where offsides<10 or offsides>20;


select team, aerials_won, aerials_lost, aerials_won_pct 
from fifa_wc_overview 
order by aerials_won_pct desc;


select `group`, count(team) 
from team_group_statistics 
group by `group`;


select team, `group` 
from team_group_statistics 
where `group`=6;


select team, `group` 
from team_group_statistics
where team='Australia';


select `group`, avg(wins) 
from team_group_statistics 
group by `group`;

 
select gs.`group`, max(gs.expected_goal_scored) as max_exp_goal_scored 
from team_group_statistics gs 
group by gs.`group` 
order by max_exp_goal_scored;


select gs.`group`, min(gs.exp_goal_conceded) as min_exp_goal_conceded 
from team_group_statistics gs 
group by gs.`group` 
order by min_exp_goal_conceded desc;


select gs.`group`, avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90 
from team_group_statistics gs 
group by gs.`group` 
order by avg_exp_goal_diff_per_90;


select team, goals_scored, goals_against 
from team_group_statistics 
where goals_scored = goals_against;


select team, players_used 
from fifa_wc_overview 
where players_used=(select max(players_used) from fifa_wc_overview);


select team, players_used, avg_age, games, minutes 
from fifa_wc_overview 
where minutes < 500 and minutes > 200;


select * 
from team_group_statistics 
order by points;


select distinct(team) 
from fifa_wc_overview 
order by team;


select ts.`group`, avg(fo.avg_age) as avg_group_age
from fifa_wc_overview fo inner join team_group_statistics ts 
on fo.team=ts.team
group by ts.`group` 
order by avg_group_age desc;


select ts.`group`, sum(fo.fouls) as sum_fouls 
from fifa_wc_overview fo inner join team_group_statistics ts 
on fo.team=ts.team
group by ts.`group` 
order by sum_fouls;


select gs.`group`, sum(td.games) as sum_games 
from fifa_wc_overview td inner join team_group_statistics gs 
on td.team=gs.team
group by gs.`group` 
order by sum_games desc;


select gs.`group`, sum(td.players_used) as sum_players_used 
from fifa_wc_overview td inner join team_group_statistics gs
on td.team=gs.team
group by gs.`group` 
order by sum_players_used;


select gs.`group`, sum(td.offsides) as sum_offsides 
from fifa_wc_overview td inner join team_group_statistics gs 
on td.team=gs.team
group by gs.`group` 
order by sum_offsides;


select gs.`group`, avg(td.passes_pct) as avg_passes_pct
from fifa_wc_overview td inner join team_group_statistics gs 
on td.team=gs.team
group by gs.`group` 
order by avg_passes_pct desc;


select ts.`group`, avg(fo.goals_per90) as avg_goals_per90
from fifa_wc_overview fo inner join team_group_statistics ts 
on fo.team=ts.team
group by ts.`group` 
order by avg_goals_per90;
