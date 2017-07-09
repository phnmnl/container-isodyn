#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates


# Download data
wget "https://drive.google.com/uc?export=download&id=0B1lAg6jyw6lveHE3UDk3SVltNkU" -O input_parameters.txt
wget "https://drive.google.com/uc?export=download&id=0B1lAg6jyw6lvYW5pS1RWb3Nwajg" -O midcor_output.csv 
wget "https://drive.google.com/uc?export=download&id=0B1lAg6jyw6lvd1k0RGNrdWdLY2M" -O plkin.p

isodyn midcor_output.csv input_parameters.txt 5;
isodyn midcor_output.csv input_parameters.txt s

# check that result file exists.
FLUXES_CONF=statfl
METAB_CONFIDENCE=statpar
CONC_PLOT=sconc.png


for f in $FLUXES_CONF $METAB_CONFIDENCE $CONC_PLOT; do
	if [ ! -f $f ]; then
   		echo "File $f does not exist, failing test."
   		exit 1
	fi
done

echo "Isodyn runs with test data without error codes, all expected files created."
