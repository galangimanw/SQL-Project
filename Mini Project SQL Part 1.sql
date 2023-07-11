/* INTRO
The company's insurance policy is up for renewal and the insurance company's
underwriters need some updated information from us before they will issue a new policy.

	OBJECTIVE
Leverega SQL skills to extract and simply analyze data from various table in the
Maven Movies database to answer the underwriter's questions */

-- Extracting staff table
select
	staff_id,
    first_name,
    last_name,
    email,
    store_id
from staff;

-- Extracting inventory table (separate counts of inventory records)
select
	count(inventory_id) as count_of_inventory_id,
    store_id
from inventory
group by store_id;

-- Extracting customer table (separate counts of customer records)
select
    count( case when active = 1 and store_id = 1 then customer_id else null end) as 'active_users_store 1',
    count( case when active = 1 and store_id = 2 then customer_id else null end) as 'active_users_store 2'
from customer;

-- Extracting customer table (providing a count of all customer email addresses)
select 
    count(email) as 'email_addresses'
from customer;

-- Extracting inventory table (providing a count of unique titles and unique categories)
select
	store_id,
    count(distinct film_id) as unique_films
from inventory
group by store_id;

select
	count(distinct name) as unique_categories
from category;

-- Extracting film table (providing the agg of replacement cost for the film)
select
	film_id,
    min(replacement_cost) as least_expensive,
    max(replacement_cost) as most_expensive,
    avg(replacement_cost) as average
from film
group by film_id;

-- Extracting payment table (providing the average payment and maximum payment)
select
avg(amount) as avg_amount,
max(amount) as max_amount
from payment;

-- Extracting payment table (providing identification values of highest volume customers)
select 
customer_id,
count(rental_id) as number_of_rentals
from payment
group by customer_id
order by count(rental_id) desc;























