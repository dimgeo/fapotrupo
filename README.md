# fapotrupo
Fapotrupo is a small program that calculates true and false positives of RT-PCR tests used for COVID19 RNA detection. It uses the Bayes Theorem and the RT-PCR specificity and sensitivity parameters from the WHO https://apps.who.int/iris/rest/bitstreams/1302653/retrieve Because prevalence is location-dependent, a vector between 1% and 20% has been defined instead of an arbitrary value.

An explanation of how the Bayes Theorem is used, is available from Numberphile on YouTube, featuring UC Berkeley professor Lisa Goldberg. https://www.youtube.com/watch?v=M8xlOm2wPAA 

This software is written in the J programming language. A development and runtime environment can be downloaded from http://www.jsoftware.com 

Please report bugs / errors to dg@biodys.com


Based on a sensitivity of 95% and a specificity of 97% as reported in the abovementioned WHO document, the following truth matrix is created. 
<pre>
┌────┬────┐
│0.95│0.03│
├────┼────┤
│0.05│0.97│
└────┴────┘
</pre>
Using the appropriate equalities to calculate the probability of false posiitives and false negatives for a prevalence up to 20%, the following tables are derived:

Probablity of TRUE positives given a certain prevalence of the disease:

<pre>
┌───────────────────────────────────────────────────┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┐
│Disease prevalence in %                            │1 │2 │3 │4 │5 │6 │7 │8 │9 │10│11│12│13│14│15│16│17│18│19│20│
├───────────────────────────────────────────────────┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┤
│Probablity of being ill while testing positive in %│17│28│38│45│50│55│59│63│66│68│71│73│74│76│78│79│80│81│82│83│
└───────────────────────────────────────────────────┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┘
</pre>
Probablity of FALSE positives given a certain prevalence of the disease:
<pre>
┌───────────────────────────────────────────────────────┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┐
│Disease prevalence in %                                │1 │2 │3 │4 │5 │6 │7 │8 │9 │10│11│12│13│14│15│16│17│18│19│20│
├───────────────────────────────────────────────────────┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┤
│Probablity of being healthy while testing positive in %│84│73│63│56│50│46│42│38│35│33│30│28│27│25│23│22│21│20│19│18│
└───────────────────────────────────────────────────────┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──
</pre>
