#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates


# Download data
wget "https://drive.google.com/uc?export=download&id=0B7S2ZMhdzWwbSVNFSlZvcGtESUk" -O input_parameters.txt
wget "https://drive.google.com/uc?export=download&id=0B7S2ZMhdzWwbRnA1dUpzYlNNMjQ" -O midcor_output.csv 

isodyn midcor_output.csv input_parameters.txt 20;
isodyn midcor_output.csv input_parameters.txt s

# check that result file exists.
FLUXES_CONF=statfl
METAB_CONFIDENCE=statpar
CONC_PLOT=figs/sconc.png


for f in $FLUXES_CONF $METAB_CONFIDENCE $CONC_PLOT; do
	if [ ! -f $f ]; then
   		echo "File $f does not exist, failing test."
   		exit 1
	fi
done

echo "Isodyn runs with test data without error codes, all expected files created."
