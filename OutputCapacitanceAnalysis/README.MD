# Output Capacitance Analysis

​	This folder contains an example circuit for determining output capacitance of  semiconductor devices.

​	Under MATLAB Scripts one can see;

- 'Circuit2' A text document that imported from LT Spice for MATLAB calculations. 
- Output_capacitance_analyzer, The main scripts that calculates output capacitance of a semiconductor with respect to its V_ds voltage
- Resonance Extractor, Extracts only required part of the graph.
- sample validate, it is a on of function to see sampling errors.
- spicetxtimport, a METLAB generated script to import LT Spice text data. 

**How to use:**

1. Simulate a resonance waveform by using the given circuit schematic. Note that it is important to sample enough data.
2. Export V_pulse and V_ds wave forms as text.
3. Add Txt files to path, import them by using the   spicetxtimport.
4. It is important to set the inductance value in the script same as the used at the LT Spice.
5. Run main script
6. (Optional) Uncomment  samplevalide function to see if the sampling is enough for proper integration and differentiation. 

**Results:**

Until now results are really close to the real datasheet data.  We noted that resistance adds just a little bit (<%2) error to the calculation. 

**TODO:**

- [x] The test is only for 120 V increase it up to 500V. Note that until know theoretical and experimental results are fit each other.
- [x] Test with different inductance values.
- [ ] Test with other MOTFET maybe to observe hysteresis.
- [ ] Comments to explain code.
- [ ] Plot improvements.
- [x] Realistic resistance calculation and simulation integration.