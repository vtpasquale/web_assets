---
title: Nastran CoFE
layout: single
classes: wide
---

NASTRAN Compatible Finite Elements (CoFE) is a standalone finite element code for structural analysis and design. CoFE is an open source program implemented using object-oriented MATLAB.The structural mesh, properties, multipoint constraints, loads, and boundary conditions are defined using the NASTRAN free field, small field, or large field bulk data input format. Definition of the objective function and constraint functions for optimization problems is done in MATLAB. Examples are provided to illustrate the straightforward process of creating analysis and optimization cases.

CoFE supports linear statics, vibration eigenpair (eigenvalues and eigenvectors), and buckling eigenpair analysis. Responses and semi-analytic sensitivities (design derivatives) are provided for displacement, internal force, stress, vibration eigenvalues and eigenvectors and buckling eigenvalues and eigenvectors. CoFE's semi-analytic sensitivities are valid for any sizing design problem and most shape design problems. The primary element types are space truss/rod elements (CROD), three-dimensional frame/beam (CBEAM) elements, isoparametric membrane-bending-shear quadrilaterals (CQUAD4), and more (CELAS2, CMASS1, CONM2). Multipoint constraints (RBE2, RBE3) are also supported. Detailed bulk-data descriptions are provided on this web page - see the "Bulk Data Inputs" drop down menu.

Since the code uses NASTRAN formatted input, commercial preprocessing tools (e.g. FEMAP or PATRAN) can be used to create or check the bulk data inputs. New analysis models can easily be verified using a commercial version of NASTRAN, if desired. CoFE's dedicated postprocesser can read commercial-NASTRAN .pch output for direct response comparison and verification.

CoFE seamlessly integrates with MATLAB-based optimization tools. A gradient-based optimizer by Spillman and Canfield is integrated and used for the example optimization problems. MATLAB's optimization toolbox is required for the optimization examples to run. Users are encouraged to run the analysis and optimization examples. Users who are experienced with finite element analysis, especially NASTRAN, will find the program intuitive.

The code was originally developed to support optimization for aeroelastic scaling research. I'm releasing CoFE on this site with the hope that it might be useful to others. The code may not be useful for industrial purposes, but I suspect that it might have value for education and research. Students of the finite element method or engineering design optimization may benefit from access to a featured program, including source code, with a NASTRAN style input format. Researchers who are focused on new optimization methods and algorithms may benefit from a ready-to-use structural analysis with semi-analytic sensitivities. All of the source files are included. I would argue that the code is well commented. Users are free to modify the code or take pieces of the code and use them elsewhere. I do ask those who use CoFE for published work to cite:

> Ricciardi, A. P., Canfield, R. A., Patil, M. P., and Lindsley, N., ''Nonlinear Aeroelastic Scaled-Model Design,'' doi: [10.2514/1.C033171](https://dx.doi.org/10.2514/1.C033171) Journal of Aircraft, Vol. 53, No. 1 (2016), pp. 20-32.

Please feel free to contact me at: pasquale(a t)vt.edu to report bugs, or if you have any questions. Even if you don't have any issues, if you decide to use CoFE, send me a message and let me know what you are doing with it.