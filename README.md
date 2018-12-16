# AMVML

Prediction of potential miRNA-disease associations based on adaptive multi-view multi-label learning

**Method Description**

AMVML is a computational framework that can effectively and reliably uncover potential disease-related miRNAs. It learns a new affinity graph adaptively for both diseases and miRNAs from multiple biological data sources. It also simultaneously update the miRNA-disease association predicted from both spaces based on multiple learning. In particular, the convergence of AMVML has been proved theoretically and the corresponding analysis indicates that it has a fast convergence rate. It is also worth mentioning that AMVML can be easily extended if there are more biological datasets available. 

**Requirements**

AMVML was developed in MATLAB 2014b environment, but it should be working in all MATLAB versions. 

**Usage**

We provided two functions, case study and global leave-one-out cross-validation(LOOCV), for users. To run the case study, please load the script 'caseStudy.m' into your MATLAB programming environment and click 'run'. To run global LOOCV, please load the script 'global_loocv.m' accordingly and other operations are the same as that of case study. Users can also run the scripts in standard command-line mode, where you should input the following commands for each function, respectively:

matlab -nodisplay -nodesktop -nosplash -r "global_loocv;exit;"

matlab -nodisplay -nodesktop -nosplash -r "caseStudy;exit;"


All the datasets used in the code, i.e. miRNA sequence similarity, miRNA functional similarity, miRNA semantic similarity, disease semantic similarity and miRNA-disease associations are all provided in the corresponding 'datasets/\*.mat'.

**Parameters**

There are two parameters alpha and beta in AMVML. The default value for both parameters are 1e-4. Users can change their value in "MultiViewPrediction.m" file.

**Output**

The default output directory of AMVML is under the same directory where the scripts locate and it can be changed in the 'caseStudy.m' and 'global_loocv.m' file accordingly. All the results are stored in 'mat' file for convenience.

**Contact**

For any questions regarding our work, please feel free to contact us: alcs417@sdnu.edu.cn.
