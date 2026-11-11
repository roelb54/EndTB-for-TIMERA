TBVx_XMLinput_template.xml

The generic XML input file for the TB models.

To note:

PARAMETER VALUES 
The parameters are set at their means, except for two parameters which have this comment:
<!-- INPUT COUNTRY SPECIFIC VALUE-->
which indicates that the parameter is country specific.

TREATMENT INITIATION
Treatment initiation may vary by country. The generic format is included in the xml with explanations for potential modifications.

TREATMENT SUCCESS/FAILURE/MORTALITY
Treatment success/failure/mortality may vary by country. The generic format is included in the xml with explanations for potential modifications.

HIV INCLUSION
HIV inclusion will vary by country. The template xml does NOT have HIV included. 


Updates:
13/11/2020 - The SES adjustment for treatment initiation rate revised such that TIR is divided by (1-pE) instead of multiplied. This is because the adjustment is to ensure that high SES has a higher treatment initiation rate. 

10/11/2020 - Flows including theta/sigma/rho were updated to be max(lower bound, theta*j1) etc. and are indicated in the xml with " <!-- NOTE: specification modified--> " 

