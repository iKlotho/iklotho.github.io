Title: FreeSWITCH Randomly Answer Calls 
Date: 2020-12-24
Slug: freeswitch-randomly-answer-calls

I needed to answer calls randomly and came across the [mod_expr](https://freeswitch.org/confluence/display/FREESWITCH/mod_expr) module that is used to evaluate math functions. The below script generates a number between 1 and 4. It then checks if the generated number is greater than 2. If true, it answers the call and sends a random DTMF. If false, it hangs up the call with `NO_ANSWER`.

<script src="https://gist.github.com/iKlotho/1f24981822b1869c688db052cf4cb78b.js"></script>
