Title: Gevent Creating Progress Bar with TQDM
Date: 2020-08-20
Slug: gevent-creating-progress-bar-with-tqdm

<a href="https://github.com/tqdm/tqdm" target="_blank"> tqdm </a> is a library for showing progress bar on
command line. Using it with gevent has
problems. I managed to workaround with <a href="https://github.com/tqdm/tqdm" , target="_blank">
contextmanager </a> and <a href="http://www.gevent.org/api/gevent.local.html" target="_blank"> local </a>.
The example mocks a network request and process data with seperate Greenlet. We link these Greenlets to update
tqdm instance so it can print progress bar correctly.

Here is the sample code for using tqdm with gevent

<script src="https://gist.github.com/iKlotho/79ae067807fdabc1992786f0f9cea82c.js"></script>
