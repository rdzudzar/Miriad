#!/bin/bash

# Save multiple spectra with different box sizes aroud galaxy central postition.

for size in {1..11..2}
	do
		mbspect in=j1250s1g6v20.mir \
		coord=12:50:52.75,-20:22:16.45 \
		width=$size \
		xaxis=FELO \
		yaxis=sum \
		order=-1 \
		options=measure \
		mask=7910,7990 \
		profile=7910,7990 \
		log=spec_$size \
		| tee res_$size
		cat res_$size spec_$size > output_$size
		rm res_$size
		rm spec_$size
	done
