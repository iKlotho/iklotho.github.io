Title: Django Architect Post Migrate Signal
Date: 2021-09-05
Slug: django-architect-post-migrate-signal

I just started to use architect to create a partition on PostgreSQL tables. To create a partition you either have to call the below command from a shell or call after a migration.

```shell
architect partition --module path.to.the.model.module
```
To create partition on tables I created an app on the project and connected my script to post_migrate signal using apps.py. It didn't work as expected after searching the issue I found that post_migrate is different from signals
and './manage.py' command will not execute the code from the apps.py files or the signals.py files. To fix the issue we need to place the signal function in models.py.


<script src="https://gist.github.com/iKlotho/479e8aa8469b3c647b3b67d2720e1108.js"></script>