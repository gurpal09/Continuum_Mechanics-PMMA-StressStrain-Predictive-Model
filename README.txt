# Continuum_Mechanics-PMMA-StressStrain-Predictive-Model
Done by Gurpal Singh 05/01/2018 Boise State University

This project involved obtaining experimental data from academic sources and fitting a predictive model to the data. 
The model predicts deformation (strain) given measured stress/strain data.
The model is nonlinear and a r^2 metric was used to find a 'good fit.'
The project was completed in Matlab and the file descriptions are given below:

- Maxwell.m           -> Computes the Maxwell model 
- Model_Comparison.m  -> Compares model and gives r^2 value
- LinearElasticIso.m  -> Computes the simple linear elastic model for data
- Sensitivity_Study.m -> Study to optimize coefficients for DSGZ model
- Model_vs_Exp.m      -> Compares model with experimental results
- Voight.m            -> Computes voight model for data
- Mooney_Rivlen.m     -> Computes Mooney_Rivlen model for data
- rsquare.m           -> Function to compute r^2 value
- data.m              -> Data extracted using Grabit from academic papers
- grabit.m            -> Function to grab data from images
- Curvefit.m          -> Function for fitting curve to data and optimize coeffs

A pdf report of the project is included for anyone that is interested!
