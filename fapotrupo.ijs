NB. Sensitivity and prevalence reported by WHO
sens=: 0.95
spec=: 0.97

NB. Prevalence vector from 0.01 to 0.02
prev=: (1 + i. 20) % 100

NB. truth matrix
matrix=: 2 2 $  sens ,(1-spec), (1-sens), spec 

NB. matrix indices

tp =: 0{0&{
fp =: 1{0&{
fn =: 0{1&{
tn =: 1{1&{

NB. Probablity of true positives, false negatives, false positives and true negatives
NB. Using Bayes Theorem

NB. Propbability of positive tests (denominator in Bayes test ) P(pos) = tp * prev + fp*(1-prev)

Ppos =: (( tp matrix) * prev )    +    ( (fp matrix) * (1 - prev))
Pneg =: (( fn matrix ) * (prev)) + ( (tn matrix ) * (1-prev))

Ps_p=:       ;/ >. 100 *  Ppos % ~ prev * tp matrix                  NB. P(sick|positive)  true positive
Ps_n=:	     ;/ >. 100 *  Pneg % ~  prev * fn matrix              NB. P(sick|negative) false negative
Ph_p=:	     ;/ >. 100 *  Ppos % ~ (1-prev) * fp matrix	             NB. P(healthy|positive) false positive
Ph_n=:	     ;/ >. 100 *  Pneg % ~ (1-prev) * tn matrix               NB. P(healthy|negative) true negative

preva =: ;/ 100 * prev

NB. Pretty printing
NB. Probablities of true positives
Psp_t=:      ('Disease prevalence in %';preva)       ,: 'Probablity of being ill while testing positive in %'; Ps_p
NB. Probabilities of false positive
Php_t=:      ('Disease prevalence in %';preva)       ,: 'Probablity of being healthy while testing positive in %'; Ph_p
