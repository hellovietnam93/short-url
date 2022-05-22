1. Caching
- Basically we will need to re-caching at the decode endpoint because usually there will be many requests to be called there. Data will be retrieved from the cache instead of directly from the database. The number of clicks will also be temporarily cached and synchronized to the database after a period of time.
2. Allow authenticate user can choose short link
- Future extension may provide free service to guest users, they will only use short url randomization service
- However, for potential customers, they can choose a name for the url for convenience. For example:
  - A customer has a link to recommend the product: They can enter short url as "prdA1" instead of "abcer1"
3. Set auto remove un-used link for a period
- In some cases users can use short url but then almost never use short link again. We can based on the number of clicks over a period of time to delete accordingly instead of storing unused links.
- In addition, we can even make the link last longer for logged in users or even charge users if they want the link to last longer.
4. Allow user enter longer url
- For sample project I setup validate for url input length only 256 characters. Actually we can use link with longer length
