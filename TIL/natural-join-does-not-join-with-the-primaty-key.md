# NATURAL JOIN Does Not Join On The Primary Key

As I added an `is_valid` column to my `Imageset` table, suddenly all queries with a `NATURAL JOIN imageset` started to break unit tests.  
I learned that it's because Natural joins simply join tables based on column names and the `Image` table happen to already have an `is_valid` column.  
**INNER JOIN does not look for a match with the primary key first, or at least a foreign key**. In my case it was joining on `is_valid` while `image_id` the primary key of the `Image` table and also the foreign key between the 2 tables.  
Mind. Blown.  
The  choice is probably deterministic so it's not really _any key_ but I'm too lazy to look at the MySQL implementation.  


The takeway here is to use `INNER JOIN` instead.
