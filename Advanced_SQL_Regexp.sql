/*REGULAR EXPRESSIONS*/

select
	*
from
	products p
where
	p.description like '%Playstation 5%'
or	p.description like '%PS5%'

/*REGEXP_MATCHES allows us to feed in the description or field we want
to look at and insepct for performing the match on then we specify what the parameters are

*/

select
	p.description
	, regexp_matches(p.description,'PS5 | Playstation 5' )
from
	products p