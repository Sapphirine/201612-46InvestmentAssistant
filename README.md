# 201612-46InvestmentAssistant

Big Data Project

The main part of this project are two .py files, one of them will traverse the data folder which contains all the instruments’ stock price data to compute all the company’s value at risk and expected shortfall by using the parametric method. The other one will compute the VaR and ES only for one company via the Monte Carlo method, since the Monte Carlo method’s outcome should be more accurate and the volume of calculation for the method is so large that even the calculation of one company’s data using the parallelization of Spark takes quite a long time. 

To run these two .py files in standalone mode, move to the directory where your spark lies, use ./bin/spark-submit command to run them. 

Make sure this directory has folders named as 'ES_res' and 'VaR_res'，these two folder will hold your result.

Change the variable 'dir' inside these two py files to the directory where you put the data, be aware that the program only tranverse a folder with only the datafile with certain format. 

For the py file calculating the VaR via Monte Carlo method, you should not only change the 'dir' but also the filename inside to do the calculation, since the volume of calculation is so large, in our demo, we just calculate VaR for one instrument.

For the matlab gui, run it with the unzip stock.zip file inside the 'MATLAB_GUI' folder.


Down load the data set we use from here http://stooq.com/db/h/
