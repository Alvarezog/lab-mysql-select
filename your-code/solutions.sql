SELECT au.au_id, au.au_lname, au.au_fname, ti.title , pu.pub_name
FROM publications.authors as au
INNER JOIN publications.titleauthor as aut ON aut.au_id = au.au_id
INNER JOIN publications.titles as ti ON ti.title_id = aut.title_id
INNER JOIN publications.publishers as pu ON pu.pub_id = ti.pub_id;

SELECT au.au_id, au.au_lname, au.au_fname, ti.title , pu.pub_name, COUNT(ti.title) as 'Title count'
FROM publications.authors as au
INNER JOIN publications.titleauthor as aut ON aut.au_id = au.au_id
INNER JOIN publications.titles as ti ON ti.title_id = aut.title_id
INNER JOIN publications.publishers as pu ON pu.pub_id = ti.pub_id
GROUP BY au.au_lname, au.au_fname;

SELECT au.au_id, au.au_lname, au.au_fname, sa.qty
FROM publications.authors as au
INNER JOIN publications.titleauthor as aut ON aut.au_id = au.au_id
INNER JOIN publications.titles as ti ON ti.title_id = aut.title_id
INNER JOIN publications.sales as sa ON ti.title_id = sa.title_id
GROUP BY au.au_id
ORDER BY qty DESC
LIMIT 3;

SELECT au.au_id, au.au_lname, au.au_fname, COALESCE(sa.qty, 0 ) as 'Total'
FROM publications.authors as au
LEFT JOIN publications.titleauthor as aut ON aut.au_id = au.au_id
LEFT JOIN publications.titles as ti ON ti.title_id = aut.title_id
LEFT JOIN publications.sales as sa ON ti.title_id = sa.title_id
GROUP BY au.au_id
ORDER BY qty DESC;