
ppcalc=: monad define
sens=: 0{ y
spec=: 1{ y
prov=: 2{ y
prev=: ( 1+ i.  prov) % 100
mats =: sens ,(1-spec), (1-sens), spec 

tp =: 0{mats
fp =: 1{mats
fn =: 2{mats
tn =: 3{mats

Ppos =: (( tp) * prev )    +    ( (fp ) * (1 - prev))
Pneg =: (( fn  ) * (prev)) + ( (tn  ) * (1-prev))
Ps_p=:       ;/ >. 100 *  Ppos % ~ prev * tp                   NB. P(sick|positive)  true positive
Ps_n=:	     ;/ >. 100 *  Pneg % ~  prev * fn               NB. P(sick|negative) false negative
Ph_p=:	     ;/ >. 100 *  Ppos % ~ (1-prev) * fp 	             NB. P(healthy|positive) false positive
Ph_n=:	     ;/ >. 100 *  Pneg % ~ (1-prev) * tn                NB. P(healthy|negative) true negative
preva =: ;/ 100 * prev

NB. Pretty printing
NB. Probablities of true positives

NB. Probabilities of false positive


Php_t=:      ('Disease prevalence in %';preva)       ,: 'Probablity of being healthy while testing positive in %'; Ph_p
Psp_t=:      ('Disease prevalence in %';preva)       ,: 'Probablity of being ill while testing positive in %'; Ps_p
Phn_t=:     ('Disease prevalence in %';preva)       ,: 'Probablity of being healthy while testing negative in %'; Ph_n

Psn_t=: ('Disease prevalence in %';preva)       ,: 'Probablity of being ill while testing negative in %'; Ps_n
Php_t,Psp_t,Phn_t,Psn_t
)

NB. use ppcalc sens spec prev

