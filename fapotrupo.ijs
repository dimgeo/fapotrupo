NB. Sensitivity and prevalence reported by WHO
NB. sens=: 0.95
NB. spec=: 0.97

NB. Prevalence vector from 0.01 to 0.02
prev=: (1 + i. 80) % 100

NB. truth matrix
matrix=: 2 2 $ 0.95 0.03 0.05 0.97

NB. matrix indices

tp =: 0{0&{
fn =: 1{0&{
fp =: 0{1&{
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

NB. Probablities of true positives
Psp_t=:      ('Disease prevalence in %';preva)              ,: 'Probablity of being ill while testing positive %'; Ps_p
NB. Probabilities of false positives
Php_t=:      ('Disease prevalence in %';preva)              ,: 'Probablity of being healthy while testing positive %'; Ph_p