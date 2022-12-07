

Question 1)

select firstname,lastname from wizard
inner join player on player.wizard_id=wizard.id
where player.`enrollment_date` between '1995-01-01' and '1998-01-01';

ou

select firstname,lastname from wizard
where id in (select wizard_id from player where `enrollment_date` between '1995-01-01' and '1998-01-01' );



Question 2)

select firstname,lastname from wizard 
where id in
 (select wizard_id from player where `enrollment_date` between '1995-01-01' and '1998-01-01' and `role`='keeper' );
 
 
 
Question 3)

select firstname,lastname from wizard 
where id in
 (select wizard_id from player where `enrollment_date` between '1995-01-01' and '1998-01-01' and `role`='chaser' );



Question 4)

CREATE VIEW count_players AS (
                              SELECT name,role, count(role)
                              FROM player
                              join wizard on wizard.id=player.wizard_id
                              join team on  team.id = player.team_id
                              GROUP BY role,name
                            
                              );
                              select* from count_players;
                              
                              

Question 5

CREATE VIEW count_players AS (
                              SELECT `name`,firstname,lastname,`role`
                              FROM player
                              join wizard on wizard.id=player.wizard_id
                              
                              join team on  team.id = player.team_id
                              GROUP BY wizard_id 
                              having team.`name`= 'Gryffindor'
                              );
                              select* from count_players;
                              
                              
                              
                              

