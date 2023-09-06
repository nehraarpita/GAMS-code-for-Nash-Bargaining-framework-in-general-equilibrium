** The balanced SAM equations had to be scaled: every number was divoded by 1000
* RAS procedure for balancing a SAM
** -0.75 tax
Sets
      i steps /1*5/
      j steps /1*5/;

Scalar V1bar initial autarky utility for region 1 /10/;
Scalar v1prop proportion of v1a /0.99/;
Scalar V2bar initial autarky utility for region 2 /10/;
Scalar v2prop proportion of v1a /0.99/;
Scalar t1 tax on region 1's water /0/;
Scalar t2 tax on region 2's water /0/;
Scalar u looping increment for r1   /0/;
scalar y looping increment for r2 /0/;

* Setup a Social Accounting Matrix to hold the data

TABLE SAMC
        AG          COMP         WATER       OTHER         HLD
AG                                                     47475.65357
COMP                                                   4871939.300
WATER 6563.869    14674.705
OTHER 40911.784   4857264.6
HLD                           21238.574     4898176.4
;

TABLE SAMWF
        AG           COMP           WATER       OTHER         HLD
AG                                                         38184.800
COMP                                                       28173200
WATER 5617.878968   31572.820
OTHER 32566.920      28141600
HLD                              37189.38448  28174166.920
;

* Names created for parameters including initial values

PARAMETERS

pA1o price,
rX1o input 1 price,
rL1o input 2 price,
xA1o Ag water,
xC1o Compp water,
lA1o other iputs ag,
lC1o other inputs water,
X1 other inputs,
L1 other inputs,
aD1o aggregate demand for agriculture sector in region 1,
cD1o agg demand in composite sector,
pA2o price,
rX2o input 1 price,
rL2o input 2 price,
xA2o Ag water,
xC2o Comp water,
lA2o other inputs ag,
lC2o other inputs water,
X2 other inputs,
L2 other inputs,
aD2o agg demand in ag  R2,
cD2o agg demand in composite sector R2,
aS1o ag supply 1,
aS2o ag supply 2,
cS1o comp supply 1,
cS2o comp supply 2,
alpha1 agr parameter,
alpha2 agr parameter2,
delta1,
delta2,
betaa1,
theta1,
betac1,
gama1,
betaa2,
theta2,
betac2,
gama2,
W1o wealth R1,
W2o wealth R2,
V1o,
V2o;


* Normalize all the prices

pA1o=1;
rX1o=1;
rL1o=1;
pA2o=1;
rX2o=1;
rL2o=1;

*Assign values to parameter from SAM

xA1o =  SAMC('WATER','AG');
xC1o =  SAMC('WATER','COMP');
lA1o =  SAMC('OTHER', 'AG');
lC1o = SAMC ('OTHER', 'COMP');
L1 = lA1o+lC1o;
X1 = xA1o+xC1o;
aD1o = SAMC('AG','HLD');
cD1o = SAMC('COMP', 'HLD');
xA2o =  SAMWF('WATER','AG');
xC2o =  SAMWF('WATER','COMP');
lA2o =  SAMWF('OTHER', 'AG');
lC2o = SAMWF('OTHER', 'COMP');
L2 = lA2o+lC2o;
X2 = xA2o+xC2o;
aD2o = SAMWF('AG','HLD');
cD2o = SAMWF('COMP', 'HLD');

* Determining other values from equilibrium conditions

aS1o=aD1o;
aS2o=aD2o;
cS1o=cD1o;
cS2o=cD2o;
W1o = cS1o+pA1o*aS1o;
W2o = cS2o+pA2o*aS2o;

*Set free parameters and calibrate others

delta1=0.5;
delta2=0.1;
alpha1 = (aD1o*pA1o)/cD1o;
alpha2 = (aD2o*pA2o)/cD2o;
betaa1 = ((xa1o*rX1o)/(xa1o*rX1o+lA1o*rL1o));
betac1 = ((xc1o*rX1o)/(xc1o*rX1o+lc1o*rL1o));
gama1 = (aS1o/((xa1o**betaa1)*(la1o**(1-betaa1))));
theta1 = (cS1o/((xC1o**betac1)*(lC1o**(1-betac1))));
betaa2 = ((xa2o*rX2o)/(xa2o*rX2o+lA2o*rL2o));
betac2 = ((xc2o*rX2o)/(xc2o*rX2o+lc2o*rL2o));
gama2 = (aS2o/((xa2o**betaa2)*(la2o**(1-betaa2))));
theta2 = (cS2o/((xC2o**betac2)*(lC2o**(1-betac2))));
V1o = delta1*aD1o**alpha1*cD1o**(1-alpha1);
V2o = delta2*aD2o**alpha2*cD2o**(1-alpha2);

DISPLAY
pA1o,
rX1o,
rL1o,
xA1o,
xC1o,
lA1o,
lC1o,
L1,
aD1o,
cD1o,
pA2o,
rX2o,
rL2o,
xA2o,
xC2o,
lA2o,
lC2o,
L2,
aD2o,
cD2o,
aS1o,
aS2o,
cS1o,
cS2o,
W1o,
W2o,
V1o,
V2o,
betaa1,
betac1,
theta1,
gama1,
betaa2,
betac2,
theta2,
alpha1,
alpha2,
gama2;

$Ontext
Autarky model
$Offtext
$Offsymxref

Variables

aD1 aggregate demand for agriculture sector in region 1,
cD1 aggregate demand for composite sector in region 1,
xA1 water used in agriculture in region 1,
xC1 water used water in composite sector in region 1,
lA1 land used in agriculture in region 1,
lC1 land used in composite sector in region 1,
pA1 price of agricultural good in region 1,
rX1 price of water input in region 1,
rL1 price of land in region 1,
aS1 aggregate supply for agriculture sector in region 1,
cS1 aggregate supply for composite sector in region 1,
V1 Utility for region 1 after Nash Bargaining
W1 Wealth in region 1
aD2 aggregate demand for agriculture sector in region 2,
cD2 aggregate demand for composite sector in region 2
xA2 water used in agriculture in region 2,
xC2 water used water in composite sector in region 2,
lA2 land used in agriculture in region 2,
lC2 land used in composite sector in region 2,
pA2 price of agricultural good in region 2,
rX2 price of water input in region 2,
rL2 price of land in region 2,
aS2 aggregate supply for agriculture sector in region 2,
cS2 aggregate supply for composite sector in region 2,
V2 Utility for region 2 after Nash Bargaining,
W2 Wealth in region 2,
mu1 LM for demand in region 1,
mu2 LM for demand function in region 2,
lamA1 LM for agriculture production in region 1,
lamA2 LM for agriculture production in region 2,
lamC1 LM for composite production in region 1,
lamC2 LM for composite production in region 2,
V Utilities for both the regions;

Equations

aD1eq equation for agricultural good's demand in region 1,
cD1eq equation for composite good's demand in region 1,
V1eq equation for utility in region 1,
aD2eq equation for agricultural good's demand in region 2,
cD2eq equation for composite good's demand in region 2,
V2eq equation for utility in region 2,
xA1eq equation for water use in agriculture in region 1,
lA1eq equation for landuse in agriculture in region 1,
rX1eq equation for water price in region 1,
L1eq equation for landuse in composite sector in region 1,
xA2eq equation for water use in agriculture in region 2,
lA2eq equation for landuse in agriculture in region 2,
rX2eq equation for water price in region 2,
L2eq equation for landuse in composite sector in region 2,
xC1eq equation for water use in region 1,
PA1eq eqaution for price of agricultural good in region 1,
rL1eq equation for land price in region 1,
aS1eq equation for agriculture sector market clearing in region 1,
cS1eq equation for composite sector market clearing in region 1,
W1eq equation for wealth in region 1,
xC2eq equation for water use in compoite sector in region 2,
PA2eq eqaution for price of agricultural good in region 2,
rL2eq equation for land price in region 2,
aS2eq equation for agriculture sector market clearing in region 2,
cS2eq equation for composite sector market clearing in region 2,
W2eq equation for wealth in region 2,
mu1eq equation for lagrangian multiplier for demand function in region 1,
mu2eq equation for lagrangian multiplier for demand function in region 2,
lamA1eq equation for lagrangian multiplier for agriculture sector production function in region 1,
lamA2eq equation for lagrangian multiplier for agriculture sector production function in region 2,
lamC1eq equation for lagrangian multiplier for composite sector production function in region 1,
lamC2eq equation for lagrangian multiplier for composite sector production function in region 2,
veq equation for sum of utilities in both regions;

aS1eq.. pA1*aS1 =e= xA1*rX1+lA1*rL1;
cS1eq.. W1 =e= cS1+pA1*aS1;
aD1eq.. aD1 =e= aS1;
cD1eq.. cD1 =e= cS1;
V1eq.. V1 =e= delta1*aD1**alpha1*cD1**(1-alpha1);
aS2eq.. pA2*aS2 =e= xA2*rX2+lA2*rL2;
cS2eq.. W2 =e= cS2+pA2*aS2 ;
aD2eq.. aD2 =e= aS2;
cD2eq.. cD2 =e= cS2;
V2eq.. V2 =e= delta2*aD2**alpha2*cD2**(1-alpha2);
mu1eq.. mu1 =e= delta1*(1-alpha1)*cD1**(-alpha1)*aD1**(alpha1);
PA1eq.. pA1*mu1 =e= delta1*alpha1*cD1**(1-alpha1)*aD1**(alpha1-1);
W1eq.. W1 =e= cD1+pA1*aD1;
mu2eq.. mu2 =e= delta2*(1-alpha2)*cD2**(-alpha2)*aD2**(alpha2);
PA2eq.. pA2*mu2 =e= delta2*alpha2*cD2**(1-alpha2)*aD2**(alpha2-1);
W2eq.. W2 =e= cD2+pA2*aD2;
xA1eq.. X1 =e= xA1+xC1;
lA1eq..  aS1 =e= gama1*(xA1**betaa1)*(lA1**(1-betaa1));
L1eq.. L1 =e= lA1+lC1;
xC1eq.. cS1 =e= theta1*(lC1**(1-betac1))*(xC1**betac1);
xA2eq.. X2 =e= xA2+xC2;
lA2eq.. aS2 =e= gama2*(xA2**betaa2)*(lA2**(1-betaa2));
L2eq.. L2 =e= lA2+lC2;
xC2eq.. cS2 =e= theta2*(lC2**(1-betac2))*(xC2**betac2);
rX1eq.. rX1 =e= lamC1*theta1*betac1*(xC1**(betac1-1))*(lC1**(1-betac1));
lamA1eq..rX1 =e= lamA1*gama1*betaa1*(xA1**(betaa1-1))*(lA1**(1-betaa1));
rL1eq.. rL1 =e= lamA1*gama1*(1-betaa1)*(xA1**betaa1)*(lA1**(-betaa1));
lamC1eq.. rL1 =e= lamC1*theta1*(1-betac1)*(xC1**betac1)*(lC1**(-betac1));
rX2eq.. rX2 =e= lamC2*theta2*betac2*(xC2**(betac2-1))*(lC2**(1-betac2));
lamA2eq.. rX2 =e= lamA2*gama2*betaa2*(xA2**(betaa2-1))*(lA2**(1-betaa2));
rL2eq.. rL2 =e= lamA2*gama2*(1-betaa2)*(xA2**betaa2)*(lA2**(-betaa2));
lamC2eq.. rL2 =e= lamC2*theta2*(1-betac2)*(xC2**betac2)*(lC2**(-betac2));
veq.. V =e= V1+V2;

***/initial values/***

aS1.l = aS1o;
cS1.l = cS1o;
xA1.l =xA1o;
rX1.l = rX1o;
aD1.l = aS1.l;
cD1.l = cS1.l;
V1.l = delta1*aD1.l**(alpha1)*cD1.l**(1-alpha1);
mu1.l = delta1*(1-alpha1)*cD1.l**(-alpha1)*aD1.l**(alpha1);
pA1.l = pA1o;
W1.l = cD1.l+pA1.l*aD1.l;
lA1.l = lA1o;
lC1.l = lC1o;
xC1.l = xC1o;
lamA1.l = (rX1.l/(gama1*betaa1*(xA1.l**(betaa1-1))*(lA1.l**(1-betaa1))));
rL1.l = rL1o;
lamC1.l = (rL1.l/(theta1*(1-betac1)*(xC1.l**betac1)*(lC1.l**(-betac1))));
aS2.l = aS2o;
cS2.l = cS2o;
xA2.l = xA2o;
rX2.l = rX2o;
aD2.l = aS2.l;
cD2.l = cS2.l;
V2.l = delta2*aD2.l**(alpha2)*cD2.l**(1-alpha2);
mu2.l = delta2*(1-alpha2)*cD2.l**(-alpha2)*aD2.l**(alpha2);
pA2.l = pA2o;
W2.l = cD2.l+pA2.l*aD2.l;
lA2.l = lA2o;
lC2.l = lC2o;
xC2.l = xC2o;
lamA2.l = (rX2.l/(gama2*betaa2*(xA2.l**(betaa2-1))*(lA2.l**(1-betaa2))));
rL2.l = rL2o;
lamC2.l = (rL2.l/(theta2*(1-betac2)*(xC2.l**betac2)*(lC2.l**(-betac2))));
V.l = V1.l+V2.l;

model autarky / all /;

OPTION nlp=conopt;

solve autarky using nlp maximizing V;

option decimals=8;

display 'maximal number of decimal digits for display',
aS1.l,
cS1.l,
aD1.l,
cD1.l,
V1.l,
mu1.l,
pA1.l,
W1.l,
xA1.l,
xC1.l,
lA1.l,
lC1.l,
lamA1.l,
rX1.l,
lamC1.l,
rL1.l,
aS2.l,
cS2.l,
aD2.l,
cD2.l,
V2.l,
mu2.l,
pA2.l,
W2.l,
xA2.l,
xC2.l,
lA2.l,
lC2.l,
lamA2.l,
rX2.l,
rL2.l,
lamC2.l,
V.l,
alpha1;

$ontext

FILE autarky1 /C:\Users\nehra\Box Sync\Nash Bargaining project\autarky1.txt/;
PUT autarky1;

put
aD1.l,
cD1.l,
xA1.l,
xC1.l,
V1.l,
W1.l,
aD2.l,
cD2.l,
xA2.l,
xC2.l,
V2.l,
W2.l,
V.l;

putclose;

$offtext

Parameters

aD1a aggregate demand for agriculture sector in region 1,
cD1a aggregate demand for composite sector in region 1,
xA1a water used in agriculture in region 1,
xC1a water used water in composite sector in region 1,
lA1a land used in agriculture in region 1,
lC1a land used in composite sector in region 1,
pA1a price of agricultural good in region 1,
rX1a price of water input in region 1,
rL1a price of land in region 1,
aS1a aggregate supply for agriculture sector in region 1,
cS1a aggregate supply for composite sector in region 1,
V1a Utility for region 1 after Nash Bargaining,
W1a Wealth in region 1,
aD2a aggregate demand for agriculture sector in region 2,
cD2a aggregate demand for composite sector in region 2
xA2a water used in agriculture in region 2,
xC2a water used water in composite sector in region 2,
lA2a land used in agriculture in region 2,
lC2a land used in composite sector in region 2,
pA2a price of agricultural good in region 2,
rX2a price of water input in region 2,
rL2a price of land in region 2,
aS2a aggregate supply for agriculture sector in region 2,
cS2a aggregate supply for composite sector in region 2,
V2a Utility for region 2 after Nash Bargaining,
W2a Wealth in region 2,
mu1a LM for demand in region 1,
mu2a LM for demand function in region 2,
lamA1a LM for agriculture production in region 1,
lamA2a LM for agriculture production in region 2,
lamC1a LM for composite production in region 1,
lamC2a LM for composite production in region 2;

aD1a = aD1.l;
cD1a = cD1.l;
xA1a = xA1.l;
xC1a = xC1.l;
lA1a = lA1.l;
lC1a = lC1.l;
pA1a = pA1.l;
rX1a = rX1.l;
rL1a = rL1.l;
aS1a = aS1.l;
cS1a = cS1.l;
V1a = V1.l;
W1a = W1.l;
aD2a = aD2.l;
cD2a = cD2.l;
xA2a = xA2.l;
xC2a = xC2.l;
lA2a = lA2.l;
lC2a = lC2.l;
pA2a = pA2.l;
rX2a = rX2.l;
rL2a = rL2.l;
aS2a = aS2.l;
cS2a = cS2.l;
V2a = V2.l;
W2a = W2.l;
mu1a = mu1.l;
mu2a = mu2.l;
lamA1a = lamA1.l;
lamA2a = lamA2.l;
lamC1a = lamC1.l;
lamC2a = lamC2.l;

$Ontext
Nash bargaining model
$Offtext
$Offsymxref

Parameters
r1 growth rate in region 1's water supply as a result of NB agreement,
r2 growth rate in region 2's land base (relative to region 1's);

r1=1.2;
r2=1.1;

Variables

nbaD1 aggregate demand for agriculture sector in region 1,
nbcD1 aggregate demand for composite sector in region 1,
nbxA1 water used in agriculture in region 1,
nbxC1 water used water in composite sector in region 1,
nblA1 land used in agriculture in region 1,
nblC1 land used in composite sector in region 1,
nbpA price of agricultural good in regions 1 and 2,
nbrX1 price of water input in region 1,
nbrL1 price of land in region 1,
nbaS1 aggregate supply for agriculture sector in region 1,
nbcS1 aggregate supply for composite sector in region 1,
nbV1 Utility for region 1 after Nash Bargaining,
nbW1 Wealth in region 1,
nbaD2 aggregate demand for agriculture sector in region 2,
nbcD2 aggregate demand for composite sector in region 2,
nbxA2 water used in agriculture in region 2,
nbxC2 water used water in composite sector in region 2,
nblA2 land used in agriculture in region 2,
nblC2 land used in composite sector in region 2,
*nbpA2 price of agricultural good in region 2,
nbrX2 price of water input in region 2,
nbrL2 price of land in region 2,
nbaS2 aggregate supply for agriculture sector in region 2,
nbcS2 aggregate supply for composite sector in region 2,
nbV2 Utility for region 2 after Nash Bargaining,
nbW2 Wealth in region 2,
nbmu1 LM for demand in region 1,
nbmu2 LM for demand function in region 2,
nblamA1 LM for agriculture production in region 1,
nblamA2 LM for agriculture production in region 2,
nblamC1 LM for composite production in region 1,
nblamC2 LM for composite production in region 2,
CV1 compensating variation region 1,
CV2 compensating variation region 2,
wvalue1 value of water transfer (region 1),
wvalue2 value of water transfer (region 2),
nbV Utility from both the regions;


Equations

nbaD1eq equation for agricultural good's demand in region 1,
nbcD1eq equation for composite good's demand in region 1,
nbV1eq equation for utility in region 1,
*nbaD2eq equation for agricultural good's demand in region 2,
nbcD2eq equation for composite good's demand in region 2,
nbV2eq equation for utility in region 2,
nbxA1eq equation for water use in agriculture in region 1,
nblA1eq equation for landuse in agriculture in region 1,
nbrX1eq equation for water price in region 1,
nbL1eq equation for landuse in composite sector in region 1,
nbxA2eq equation for water use in agriculture in region 2,
nblA2eq equation for landuse in agriculture in region 2,
nbrX2eq equation for water price in region 2,
nbL2eq equation for landuse in composite sector in region 2,
nbxC1eq equation for water use in composite in region 1,
nbPA1eq eqaution for price of agricultural good in region 1,
nbrL1eq equation for land price in region 1,
nbaS1eq equation for agriculture sector market clearing in region 1,
nbcS1eq equation for composite sector market clearing in region 1,
nbW1eq equation for wealth in region 1,
nbxC2eq equation for water use in composite in region 2,
nbPA2eq eqaution for price of agricultural good in region 2,
nbrL2eq equation for land price in region 2,
nbaS2eq equation for agriculture sector market clearing in region 2,
nbcS2eq equation for composite sector market clearing in region 2,
nbW2eq equation for wealth in region 2,
nbVeq equation for combined utility of both regions,
CV1eq equation for CV1,
CV2eq equation for CV2,
nbmu1eq equation for lagrangian multiplier for demand function in region 1,
nbmu2eq equation for lagrangian multiplier for demand function in region 2,
nblamA1eq equation for lagrangian multiplier for agriculture sector production function in region 1,
nblamA2eq equation for lagrangian multiplier for agriculture sector production function in region 2,
nblamC1eq equation for lagrangian multiplier for composite sector production function in region 1,
nblamC2eq equation for lagrangian multiplier for composite sector production function in region 2,
wvalue1eq equation for wvalue1,
wvalue2eq equation for wvalue2;

nbaS1eq.. nbpA*nbaS1 =e= nbxA1*nbrX1+nblA1*nbrL1;
nbcS1eq.. nbcS1 =e= nbW1-nbpA*nbaS1 ;
nbaD1eq.. nbaD1+nbaD2 =e= nbaS1+nbaS2;
nbcD1eq.. nbcD1 =e= nbcS1;
nbV1eq.. nbV1 =e= delta1*nbaD1**(alpha1)*nbcD1**(1-alpha1);
nbaS2eq.. nbpA*nbaS2 =e= nbxA2*nbrX2+nblA2*nbrL2;
nbcS2eq.. nbcS2 =e= nbW2-nbpA*nbaS2 ;
*nbaD2eq.. nbaD2 =e= nbaS2;
nbcD2eq.. nbcD2 =e= nbcS2;
nbV2eq.. nbV2 =e= delta2*nbaD2**(alpha2)*nbcD2**(1-alpha2);
nbmu1eq.. nbmu1 =e= (delta2*(nbaD2**(alpha2))*(nbcD2**(1-alpha2))-(v2prop*v2a))*delta1*(1-alpha1)*(nbcD1**(-alpha1))*(nbaD1**(alpha1));
nbPA1eq.. nbpA*nbmu1 =e= (delta2*(nbaD2**(alpha2))*(nbcD2**(1-alpha2))-(v2prop*v2a))*delta1*alpha1*(nbcD1**(1-alpha1))*(nbaD1**(alpha1-1));
nbW1eq.. nbW1 =e= nbcD1+nbpA*nbaD1-(1+t1)*(nbrX1*(r1*X1-(nbxA1+nbxC1)));
nbmu2eq.. nbmu2 =e= (delta1*(nbaD1**(alpha1))*(nbcD1**(1-alpha1))-(v1prop*v1a))*delta2*(1-alpha2)*(nbcD2**(-alpha2))*(nbaD2**(alpha2));
nbPA2eq.. nbpA*nbmu2 =e= (delta1*(nbaD1**(alpha1))*(nbcD1**(1-alpha1))-(v1prop*v1a))*delta2*alpha2*(nbcD2**(1-alpha2))*(nbaD2**(alpha2-1));
nbW2eq.. nbW2 =e= nbcD2+nbpA*nbaD2-(1+t1)*(nbrX2*(r2*X2-(nbxA2+nbxC2)));
nbxA1eq.. (r1*X1)+(r2*X2) =e= nbxA1+nbxA2+nbxC1+nbxC2;
nblA1eq..  nblA1 =e= (nbaS1/(gama1*(nbxA1**betaa1)))**(1/(1-betaa1));
nbL1eq.. nblC1 =e= L1-nblA1;
nbxC1eq.. nbxC1 =e= (nbcS1/(theta1*(nblC1**(1-betac1))))**(1/betac1);
nbrX1eq.. nbrX1 =e= nblamC1*theta1*betac1*(nbxC1**(betac1-1))*(nblC1**(1-betac1));
nblamA1eq.. nblamA1 =e= nbrX1/(gama1*betaa1*(nbxA1**(betaa1-1))*(nblA1**(1-betaa1)));
nbrL1eq.. nbrL1 =e= nblamA1*gama1*(1-betaa1)*(nbxA1**betaa1)*(nblA1**(-betaa1));
nblamC1eq.. nblamC1 =e= (nbrL1/(theta1*(1-betac1)*(nbxC1**betac1)*(nblC1**(-betac1))));
nbrX2eq.. nbrX2 =e= nbrX1;
nbxA2eq.. nbxA2 =e= (nbrL2/(nblamA2*gama2*(1-betaa2)*(nblA2**(-betaa2))))**(1/betaa2);
nblA2eq.. nblA2 =e= (nbaS2/(gama2*(nbxA2**betaa2)))**(1/(1-betaa2));
nbL2eq.. nblC2 =e= L2-nblA2;
nbxC2eq.. nbxC2 =e= (nbcS2/(theta2*(nblC2**(1-betac2))))**(1/betac2);
nblamC2eq.. nblamC2 =e= (nbrX2/(theta2*betac2*(nbxC2**(betac2-1))*(nblC2**(1-betac2))));
nbrL2eq.. nbrL2 =e= nblamC2*theta2*(1-betac2)*(nbxC2**betac2)*(nblC2**(-betac2));
nblamA2eq.. nblamA2 =e= (nbrX2/(gama2*betaa2*(nbxA2**(betaa2-1))*(nblA2**(1-betaa2))));
CV1eq.. CV1 =e= nbw1-(((nbpA**alpha1)*v1o)/(delta1*(alpha1**alpha1)*((1-alpha1)**(1-alpha1))));
CV2eq.. CV2 =e= nbw2-(((nbpA**alpha2)*v2a)/(delta2*(alpha2**alpha2)*((1-alpha2)**(1-alpha2))));
nbVeq.. nbV =e= ((nbV1-(v1prop*V1o))*(nbV2-(v2prop*V2a)));
wvalue1eq .. wvalue1 =e= (1+t1)*(nbrX1*(r1*X1-(nbxA1+nbxC1)));
wvalue2eq .. wvalue2 =e= (1+t2)*(nbrX2*(r2*X2-(nbxA2+nbxC2)));

***/initial values/***

nbaS1.l = aS1a;
*nbaS1.l = aS1a;
*nbcS1.l = 105;
nbcS1.l = cS1a;
*nbxA1.l = 143;
nbxA1.l = xA1a;
*nbrX1.l = 0.15;
nbrX1.l = rX1a;
*nbaS2.l = 40000****;
nbaS2.l = as2a;
*nbcS2.l = 105;
nbcS2.l = cS2a;
nbaD1.l = nbaS1.l;
nbcD1.l = nbcS1.l;
nbaD2.l = nbaS2.l;
nbcD2.l = nbcS2.l;
nbV1.l = delta1*(nbaD1.l**(alpha1))*(nbcD1.l**(1-alpha1));
nbV1.lo = V1a=0.005;
*nbmu1.l = 0.18;
*nbmu1.l = mu1a;
nbmu1.l = (delta2*(nbaD2.l**(alpha2))*(nbcD2.l**(1-alpha2))-(v2prop*v2a))*delta1*(1-alpha1)*(nbcD1.l**(-alpha1))*(nbaD1.l**(alpha1));
*nbpA1.l = 1.98;
nbpA.l = pA1a;
*pA1.l = ((delta2*(aD2.l**(alpha2))*(cD2.l**(1-alpha2))-V2bar)*delta1*alpha1*(cD1.l**(1-alpha1))*(aD1.l**(alpha1-1)))/mu1.l;
*nbW1.l = 210;
nbW1.l = W1a;
*W1.l = cD1.l+pA1.l*aD1.l;
*nblA1.l = 307;
nblA1.l =lA1a;
*lA1.l = (aS1.l/(gama1*(xA1.l**betaa1)))**(1/(1-betaa1));
nblC1.l = L1-nblA1.l;
*nbxC1.l = 357;
nbxC1.l = xC1a;
*xC1.l =(cS1.l/(theta1*(lC1.l**(1-betac1))))**(1/betac1);
*nblamA1.l = 1.98;
nblamA1.l = lamA1a;
*lamA1.l = (rX1.l/(gama1*betaa1*(xA1.l**(betaa1-1))*(lA1.l**(1-betaa1))));
*nbrL1.l = 0.27;
nbrL1.l = rL1a;
*rL1.l = lamA1.l*gama1*(1-betaa1)*(xA1.l**betaa1)*(lA1.l**(-betaa1));
*nblamC1.l = 1;
nblamC1.l = lamC1a;
*lamC1.l = (rL1.l/(theta1*(1-betac1)*(xC1.l**betac1)*(lC1.l**(-betac1))));
nbrX2.l = nbrX1.l;
nbxA2.l = xA2a;
nbV2.l = delta2*(nbaD2.l**(alpha2))*(nbcD2.l**(1-alpha2));
*nbV2.lo = V2a;
*nbmu2.l = mu2a;
*nbmu2.l = nbmu1.l;
nbmu2.l = (delta1*(nbaD1.l**(alpha1))*(nbcD1.l**(1-alpha1))-(v1prop*v1a))*delta2*(1-alpha2)*(nbcD2.l**(-alpha2))*(nbaD2.l**(alpha2));
*nbpA2.l = nbpA1.l;
*pA2.l = ((delta1*(aD1.l**(alpha1))*(cD1.l**(1-alpha1))-V1bar)*delta2*alpha2*(cD2.l**(1-alpha2))*(aD2.l**(alpha2-1)))/mu2.l;
nbW2.l = W2a;
*W2.l = cD2.l+pA2.l*aD2.l;
nblA2.l = nblA1.l;
*lA2.l = (aS2.l/(gama2*(xA2.l**betaa2)))**(1/(1-betaa2));
nblC2.l = L2-nblA2.l;
nbxC2.l = ((r1*X1)+(r2*X2))-nbxA1.l-nbxA2.l-nbxC1.l;
*xC2.l = (cS2.l/(theta2*(lC2.l**(1-betac2))))**(1/betac2);
nblamC2.l =nblamC1.l;
*lamC2.l = (rX2.l/(theta2*betac2*(xC2.l**(betac2-1))*(lC2.l**(1-betac2))));
nbrL2.l =nbrL1.l;
*rL2.l = lamC2.l*theta2*(1-betac2)*(xC2.l**betac2)*(lC2.l**(-betac2));
nblamA2.l =nblamA1.l;
*lamA2.l = (rX2.l/(gama2*betaa2*(xA2.l**(betaa2-1))*(lA2.l**(1-betaa2))));
CV1.l = nbw1.l-(((nbpA.l**alpha1)*v1o)/(delta1*(alpha1**alpha1)*((1-alpha1)**(1-alpha1))));
CV2.l = nbw2.l-(((nbpA.l**alpha2)*v2a)/(delta2*(alpha2**alpha2)*((1-alpha2)**(1-alpha2))));
wvalue1.l = (1+t1)*(nbrX1.l*(r1*X1-(nbxA1.l+nbxC1.l)));
wvalue2.l = (1+t2)*(nbrX2.l*(r2*X2-(nbxA2.l+nbxC2.l)));
nbV.l =((nbV1.l-(v1prop*v1o))*(nbV2.l-(v2prop*v2a)));

model nashbargaining
/nbaD1eq,
nbcD1eq,
nbV1eq,
*nbaD2eq,
nbcD2eq,
nbV2eq,
nbxA1eq,
nblA1eq,
nbrX1eq,
nbL1eq,
nbxA2eq,
nblA2eq,
nbrX2eq,
nbL2eq,
nbxC1eq,
nbPA1eq,
nbrL1eq,
nbaS1eq,
nbcS1eq,
nbW1eq,
nbxC2eq,
nbPA2eq,
nbrL2eq,
nbaS2eq,
nbcS2eq,
nbW2eq,
nbVeq,
nbmu1eq,
nbmu2eq,
nblamA1eq,
nblamA2eq,
nblamC1eq,
nblamC2eq,
wvalue1eq,
wvalue2eq,
CV1eq,
CV2eq/ ;

OPTION nlp=conopt;
Loop((j,i),
r1=1.2+u;
r2=1.1+y;

solve nashbargaining using nlp maximizing nbV

option decimals=8;
Display
nbaD1.l,
nbcD1.l,
nbxA1.l,
nbxC1.l,
nblA1.l,
nblC1.l,
nbpA.l,
nbrX1.l,
nbrL1.l,
nbaS1.l,
nbcS1.l,
nbV1.l,
nbW1.l,
nbaD2.l,
nbcD2.l,
nbxA2.l,
nbxC2.l,
nblA2.l,
nblC2.l,
*nbpA2.l,
nbrX2.l,
nbrL2.l,
nbaS2.l,
nbcS2.l,
nbV2.l,
nbW2.l,
nbmu1.l,
nbmu2.l,
nblamA1.l,
nblamA2.l,
nblamC1.l,
nblamC2.l,
gama1,
gama2,
theta1,
theta2,
betaa1,
betaa2,
betac1,
betac2,
CV1.l,
CV2.l,
wvalue1.l,
wvalue2.l,
r1,
r2,
X1,
X2,
nbV.l;

u=u+0.05;

y=y+0.05;

);

*FILE nbresults /C:\Users\nehra\Box Sync\Nash Bargaining project\nbresults.txt/;
*PUT nbresults;

*loop(i, put i.tl); put/;
*loop(i, r1=1+u;
*put
*nbaD1.l,
*nbcD1.l,
*nbxA1.l,
*nbxC1.l,
*nbV1.l,
*nbW1.l,
*nbaD2.l,
*nbcD2.l,
*nbxA2.l,
*nbxC2.l,
*nbV2.l,
*nbW2.l,
*CV1.l,
*CV2.l,
*r1,
*r2,
*wvalue1.l,
*wvalue2.l,
*nbV.l;
**/;
*u=u+0.1;
*);
*putclose;
