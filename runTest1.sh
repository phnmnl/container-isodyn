#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates


# Download data
#wget "https://drive.google.com/uc?export=download&id=0B1lAg6jyw6lveHE3UDk3SVltNkU" -O input_parameters.txt
#wget "https://drive.google.com/uc?export=download&id=0B1lAg6jyw6lvYW5pS1RWb3Nwajg" -O midcor_output.csv 
wget "https://drive.google.com/uc?export=download&id=167is8BvoQzXIl3p0-qumSWWuAS6US2eu" -O BEAS2B-Glucose 
wget "https://drive.google.com/uc?export=download&id=1mnKcKKRTFHmqyb1aGMUHB8FSiTZ1vPrc" -O SW620-Glucose 
wget "https://drive.google.com/uc?export=download&id=1WA-n1qSRhn5kKxZqij-5Twa9LOqQRRWC" -O xglc1
wget "https://drive.google.com/uc?export=download&id=1jPMHA6OjcTWR4l3qcqt-c6g_9scBV9w4" -O xglc
wget "https://drive.google.com/uc?export=download&id=11USjmMbbcFrwgUjdc6VxYQJSH0FM2JTG" -O  glc.zip

unzip glc.zip

#isodyn midcor_output.csv input_parameters.txt 5;
#isodyn midcor_output.csv input_parameters.txt s
dokiso.sh -a SW620-Glucose -b xglc -C

# check that result file exists.
FLUXES_CONF=glc/statfl
#METAB_CONFIDENCE=statpar
#CONC_PLOT=sconc.png


for f in $FLUXES_CONF $METAB_CONFIDENCE $CONC_PLOT; do
	if [ ! -f $f ]; then
   		echo "File $f does not exist, failing test."
   		exit 1
	fi
done

echo "Isodyn runs with test data without error codes, all expected files created."
