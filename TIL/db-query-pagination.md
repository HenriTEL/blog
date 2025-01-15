# Implement Pagination

**TL;DR** Return items in reverse chronological order, optionally give the ability to return in chronological order.  
Provide previous and next page urls as [Header Links](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Link#pagination_through_links) using `ending_before` or `starting_after` some object ID and use infinite scroll if possible.  

## Page Numbers: Expensive But That's OK

We need to actually perform the SQL query and paginate with `OFFSET` and `LIMIT`.
Performance gets worse as we fetch later pages but that's ok, the 2nd page of Google is the best place to hide a dead body after all.  
That's only true if the user has a ways to get the desired result on the first page with attributes filters and ordering.  
The GitHub API pagninates like that.  
Keep in mind that results varies and can be lost as items gets added/removed while the user goes through the pages.  

## Total Pages, The Luxury Feature

Make that feature optional if possible.  
Return approximate results with `EXPLAIN` queries.  

## Starting After, Ending Before

The user provides an object id that acts as a fast offest to query the next page, as long as we have an index that gets monotically incremented.  
I find that adding a few letters prefix to that identifier is a nice touch that can be helpful to developers as they can enforce that identifiers of the right type is provided and it's more human readable.
For example `cus_4QFJOjw2pOmAGJ` is a customer identifier in the Stripe API.

Useful links:  
* <https://www.cybertec-postgresql.com/en/pagination-problem-total-result-count/>
* <https://docs.stripe.com/api/pagination>
