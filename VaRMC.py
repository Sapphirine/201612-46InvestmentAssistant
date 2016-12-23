# variables and set-up
# M = 1000 	# Number of paths
# N = 252	 	# Number of time steps
# T = 1.0 	# Simulation time horizon

# sigma = 0.3 	# annual volatlity 
# mu = 0.01	# annual drift rate

# dt = T/N	# simulation time step, dt should be larger enough

from scipy.stats import norm
import numpy as np
import os,sys
import math
from pyspark import SparkContext
def compute(index):
	i = index
	print(i)
	result = []
	mu_average = np.mean(np.array(rtn_value[i:i+252]))
	var_average = np.var(np.array(rtn_value[i:i+252]))
	sigma = math.sqrt(var_average)*math.sqrt(252)/math.sqrt(day)
	mu = mu_average*252/day + (sigma**2)/2
	eps = np.random.normal(0,1,M)
	R = np.zeros((M,1))
	R[:]= 0
	for m in range(M):
		R[m] = np.exp((mu - sigma**2/2)/252 + sigma/np.sqrt(252)*eps[m])
	sort_result = np.sort(R, axis = None)
	temp = 1-sort_result[np.int(0.05 * len(R))]
	result.append(temp) # last column
	return result

dir = '/Users/maolinzuo/Desktop/data 2/daily/us/nasdaq stocks/2'
if __name__ == '__main__':
	stockStr = []
	filename = 'aapl.us.txt'
	with open(dir + '/' + filename,'r') as file_to_read:
		while True:
			lines = file_to_read.readline()
			if not lines:
				break
				pass
			close = lines.split(',')
			stockStr.append(close[4])
	file_to_read.close()
	stock = []
			
	for i in range(1,len(stockStr)):
		stock.append(float(stockStr[i]))
	stock.reverse()
	rtn_value = []
	for i in range(0,len(stock)-1):
		rtn_value.append(math.log(stock[i]/stock[i+1]))
	M = 10000
	day = 1
	dt = 1/252
	indexList = []
	for i in range(0,999):
		indexList.append(i)
	sc = SparkContext(appName='2')
	index_rnn = sc.parallelize(indexList)
	data_rnn = index_rnn.map(compute)
	data = data_rnn.collect()
	#sort_result = np.sort(result, axis = None)
	#print len(result)
	filename = "appl.MC.VaR.txt"
	with open(filename,'w') as file_to_write:
		file_to_write.write("days VaR"+"\n")	
		for i in range(0,len(data)):
				file_to_write.write(str(i)+" " + str(data[i])[1:][:-1]+"\n")
	file_to_write.close()
	#print sort_result[np.int(0.01 * len(result))] # 99%
	#print sort_result[np.int(0.05 * len(result))] # 95%

# def rtn(stock = Stock, delta = dt)
# 	len_Stc = len(Stock)
# 	mu = Stock.mean() # sample mean of the stock price
# 	# retn = 
# 	sigma = np.std(Stock) # standard deviation of the smaple price
# 	retn = np.zeros(len_Stc) # Initialize r
# 	eps = np.random.normal(0,1,len_Stc)
# 	for i in xrange(len_Stc):
# 		retn[i] = mu*dt + sigma*eps[i]*math.sqrt(dt)