/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
SELECT film_actor_shared.title FROM film film_actor_shared
JOIN film_actor actor_shared USING (film_id)
JOIN film_actor actor_target ON actor_shared.actor_id = actor_target.actor_id
JOIN film film_target ON actor_target.film_id = film_target.film_id
WHERE film_target.title = 'AMERICAN CIRCUS'
INTERSECT SELECT film_category_shared.title FROM film film_category_shared
JOIN film_category category_shared USING (film_id)
JOIN film_category category_target ON category_shared.category_id = category_target.category_id
JOIN film film_target ON category_target.film_id = film_target.film_id
WHERE film_target.title = 'AMERICAN CIRCUS'
GROUP BY film_category_shared.title
HAVING count(film_category_shared.title) >= 2 ORDER BY 1;
