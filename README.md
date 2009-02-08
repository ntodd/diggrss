DiggRSS
======

We hold these truths to be self-evident
----

1. Digg is an ok news source (arguably on the decline)
2. Digg users suck (all are apparently 12)
3. Digg ads suck (no, I don't want to flirt)
4. Digg RSS feeds suck (because you aren't linked directly to the content)

DiggRSS endows you with certain unalienable Rights
----

Scrape Technology stories 

		diggrss_url.com/technology
		
Just replace "technology" with any topic available on digg
		
**Coming someday** (or just fork and do it yourself): 

Scrape multiple feeds

		diggrss_url.com/technology/apple/linux

Install
----

		git clone git://github.com/ntodd/diggrss.git
		ruby diggrss/diggrss.rb

Most dependencies are vendored, so you should be good to go right off the bat.  A rackup file has been included for use with Passenger on Apache.  Just be sure to add in a tmp/ and public/ dir in the application root and passenger *should* run it with no modifications.

DiggRSS Sucks
----

Because DiggRSS actually scrapes Digg's topic pages to get the content it needs, it can only pull the relative timestamps (e.g. 4 hours ago).  I attempted to use Chronic to parse the time, but it didn't work right away.  Hence, the time is just set to the current time.  This screws things up, so this needs to be figured out before it is really ready to go.