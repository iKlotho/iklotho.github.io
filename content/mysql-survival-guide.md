Title: MySQL Survival Guide
Date: 2024-09-28
Slug: mysql-survival-guide

As I continue working with MySQL, I’ve come across a few quirks and issues that I wish I had known earlier. This blog post highlights some of the key lessons learned, and I will update it as I discover more interesting findings.

### The Upsert Problem: Auto-Increment ID Gaps
When performing an upsert (a combination of an insert and an update), MySQL can create gaps in auto-incremented IDs. This happens because failed insert attempts still consume an auto-increment ID. 

> This behaviour is not applied to natural keys

I wondered if the same issue exists in PostgreSQL and I created this little [test](https://onecompiler.com/postgresql/42ffnyhhv) and behold, there is no garbage IDs.


Possible Solutions:
- Use PostgreSQL
- Use BIGINT
- https://www.percona.com/blog/avoiding-auto-increment-holes-on-innodb-with-insert-ignore

#[stackoverflow](https://stackoverflow.com/questions/3679611/mysql-upsert-and-auto-increment-causes-gaps
)
### AWS RDS MySQL: Non-Strict SQL Mode by Default
AWS RDS comes with non-strict [SQL Mode](https://dev.mysql.com/doc/refman/8.4/en/sql-mode.html) causing errors such as overflow to raise warnings instead of errors. This issue can be fixed with settings SQL Mode after connecting to the RDS. 

I did a bit of googling and I found that someone else also encountered this issue and asked why this behaviour isn't implemented.
https://github.com/awsdocs/amazon-rds-user-guide/issues/160



You can check sql mode of the MySQL server by running the following query.
```sql
SELECT @@sql_mode;
```

> DBeaver sets `STRICT_TRANS_TABLES` flag to the connection by default.



### ENUM Fields: Beware of Reordering
Using ENUM in MySQL has its own set of caveats. If you ever need to reorder ENUM values, it triggers a full table rebuild.
