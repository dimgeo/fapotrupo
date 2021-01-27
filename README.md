# fapotrupo
Fapotrupo is a small application that calculates true and false positives of RT-PCR tests used for COVID19 RNA detection. It uses the Bayes Theorem and the RT-PCR specificity and sensitivity parameters from the WHO https://apps.who.int/iris/rest/bitstreams/1302653/retrieve Because prevalence is location-dependent, a vector between 1% and 20% has been defined instead of an arbitrary value.

An explanation of how the Bayes Theorem is used, is available from Numberphile on YouTube, featuring UC Berkeley professor Lisa Goldberg. https://www.youtube.com/watch?v=M8xlOm2wPAA 

This software is written in the J programming language. A development and runtime environment can be downloaded from http://www.jsoftware.com 


Based on a sensitivity of 95% and a specificity of 97% as reported in the abovementioned WHO document, the following truth matrix is created. 
<pre>
┌────┬────┐
│0.95│0.03│
├────┼────┤
│0.05│0.97│
└────┴────┘
</pre>
Using the appropriate equalities to calculate the probability of false positives and false negatives for a prevalence up to 20%, the following tables are derived:

Probablity of TRUE positives given a certain prevalence of the disease:

<pre>
┌───────────────────────────────────────────────────┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┐
│Disease prevalence in %                            │1 │2 │3 │4 │5 │6 │7 │8 │9 │10│11│12│13│14│15│16│17│18│19│20│
├───────────────────────────────────────────────────┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┤
│Probablity of being ill while testing positive in %│25│40│50│57│63│67│71│74│76│78│80│82│83│84│85│86│87│88│89│89│
└───────────────────────────────────────────────────┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┘
   

   
</pre>
Probablity of FALSE positives given a certain prevalence of the disease. (Note this is the inverted probability with a rounding artefact)


<pre>

┌───────────────────────────────────────────────────────┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┬──┐
│Disease prevalence in %                                │1 │2 │3 │4 │5 │6 │7 │8 │9 │10│11│12│13│14│15│16│17│18│19│20│
├───────────────────────────────────────────────────────┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┼──┤
│Probablity of being healthy while testing positive in %│76│61│51│44│38│34│30│27│25│23│21│19│18│17│16│15│14│13│12│12│
└───────────────────────────────────────────────────────┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┴──┘
   

</pre>
