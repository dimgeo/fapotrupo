NB. Sensitivity and specificity reported by WHO
NB. sens=: 0.95
NB. spec=: 0.97

NB. Prevalence vector from 0.01 to 0.2
prev=: (1 + i. 20) % 100

NB. truth matrix based on above specificity and sensitivity
NB. matrix =: 2 2 $ sens (1-spec) (1-sens) spec
matrix=: 2 2 $ 0.95 0.03 0.05 0.97

NB. matrix indices 

tp =: 0{0&{
fn =: 1{0&{
fp =: 0{1&{
tn =: 1{1&{

NB. Probablity of true positives, false negatives, false positives and true negatives
NB. Using Bayes Theorem

NB. Propbability of positive and negative tests (denominator in Bayes test )

Ppos =: (( tp matrix) * prev )    +    ( (fp matrix) * (1 - prev))
Pneg =: (( fn matrix ) * (prev)) + ( (tn matrix ) * (1-prev))

Ps_p=:       ;/ >. 100 *  Ppos % ~ prev * tp matrix                  NB. P(sick|positive)  true positive
Ps_n=:	     ;/ >. 100 *  Pneg % ~  prev * fn matrix              NB. P(sick|negative) false negative
Ph_p=:	     ;/ >. 100 *  Ppos % ~ (1-prev) * fp matrix	             NB. P(healthy|positive) false positive
Ph_n=:	     ;/ >. 100 *  Pneg % ~ (1-prev) * tn matrix               NB. P(healthy|negative) true negative

preva =: ;/ 100 * prev

NB. Pretty printing
NB. Probablities of true positives
Psp_t=:      ('Disease prevalence in %';preva)              ,: 'Probablity of being ill while testing positive in %'; Ps_p
NB. Probabilities of false positives
Php_t=:      ('Disease prevalence in %';preva)              ,: 'Probablity of being healthy while testing positive in %'; Ph_p
