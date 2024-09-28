Title: PostgreSQL Backup Encoding Fix
Date: 2020-08-25
Slug: postgresql-backup-encoding-fix

Today I dumped some data from PostgreSQL's docker instance and when I try to restore it it brokes
the data.
After checking the dump's encoding via <a href="https://man7.org/linux/man-pages/man1/file.1.html"
target="_blank">file</a> command, figured out that dump file has UTF-16 encoding. When
converting dump file
encoding to utf-8 using <a href="https://linux.die.net/man/1/iconv" target="_blank">iconv</a> it
worked.

<script src="https://gist.github.com/iKlotho/e304e370eeca784b8334b15d9704f632.js"></script>