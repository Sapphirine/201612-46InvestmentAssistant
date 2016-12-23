
from scipy.stats import norm
import numpy as np
import os,sys
import math
from pyspark import SparkContext

import matplotlib.pyplot as plt

def rtn(stock,day):  #calculating the return of stocks
	rtn_value = []
	for i in range(0,len(stock)-day):
		rtn_value.append(math.log(stock[i]/stock[i+day]))
	return rtn_value

def VaRCalculation(mu,sigma,day,p): #parametricl VaR
	qnorm = norm.ppf(1-p)
	temp = sigma/math.sqrt(252)*math.sqrt(day)*qnorm+(mu-(sigma**2)/2)/252*day
	VaR = 1 - math.exp(temp)
	return VaR

def ESCalculation(VaR,mu,sigma,day,p): #parametrical ES
	k = 1 - VaR
	d1 = (math.log(1/k) + (mu+(sigma**2)/2)*day/252)/(sigma/math.sqrt(252)*math.sqrt(day))
	pnorm = norm.cdf(d1)
	ES = 1 - math.exp(mu*day/252)*(1-pnorm)/(1-p)
	return ES


def listdir(dir,file):
    list = os.listdir(dir)
    for line in list:
        filepath = os.path.join(dir,line)
        if os.path.isdir(filepath): 
            myfile.write(line + '//'+"\n")
            for li in os.listdir(filepath):
                myfile.write(line+"\n" )
        elif os.path:
            myfile.write(line+"\n" )


def compute(filename):
# if __name__ == "__main__":
# read txt files
#	filename = 'table.txt'
	stockStr = []
	print(filename)
	with open(dir + '/' + filename,'r') as file_to_read:
		while True:
			lines = file_to_read.readline()
			if not lines:
				break
				pass
			close = lines.split(',')
			stockStr.append(close[4])

	file_to_read.close()
# calculating VaR
	stock = []
	VaR_result = []
	ES_result = []
	day = 1
	for i in range(1,len(stockStr)):
		stock.append(float(stockStr[i]))
	stock.reverse()
	for i in range(1,1000):
		rtn_value = rtn(stock[i-1:],day)
		mu_average = np.mean(np.array(rtn_value[:505]))
		var_average = np.var(np.array(rtn_value[:505]))
		sigma = math.sqrt(var_average)*math.sqrt(252)/math.sqrt(day)
		mu = mu_average*252/day + (sigma**2)/2
		p = 0.99
		VaR=VaRCalculation(mu,sigma,day,p)
		VaR_result.append(VaR)
		ES = ESCalculation(VaR,mu,sigma,day,p)
		ES_result.append(ES)
	# return VaR_result

	filename1 = './VaR_res/' + filename[:-3]+"VaR.txt"
	with open(filename1,'w') as file_to_write:	
		for i in range(0,len(VaR_result)):
			if VaR_result[i] > 0 :
				file_to_write.write(str(VaR_result[i])+"\n")
	file_to_write.close()

	# return VaR_result
	Var_draw = np.array(VaR_result)
	plt.plot(Var_draw)
	plt.gca().set_ylim(bottom=0)
	plt.xlabel('Days')
	plt.ylabel('Value at Risk(%)')
	plt.savefig('./VaR_res/' + filename[:-3]+"VaR.png")
	plt.close()
	#return ES_result
	filename2 = './res/' + filename[:-3]+".txt"
	with open(filename2,'w') as file_to_write:	
		file_to_write.write("days" + " " + "VaR" + " " + "ES"+ "\n")
		for i in range(0,len(ES_result)):
			if ES_result[i] > 0 :
				file_to_write.write(str(i) + " " + str(VaR_result[i])+" " + str(ES_result[i])+"\n")
	file_to_write.close()


	ES_draw = np.array(ES_result)
	plt.plot(ES_draw)
	plt.gca().set_ylim(bottom=0)
	plt.xlabel('Days')
	plt.ylabel('Estmated Shortfall(%)')
	plt.savefig('./ES_res/' +filename[:-3]+"ES.png")
	plt.close()



dir = '/Users/maolinzuo/Desktop/data 2/daily/us/nasdaq stocks/2'
if __name__ == '__main__':	
	myfile = open('list.txt','w')
	listdir(dir,myfile)
	myfile.close()

	# read list files and implement the list
	filename = 'list.txt'
	fileNameList = []
	with open(filename,'r') as file_to_read:
		while True:
			lines = file_to_read.readline()
			if not lines:
				break
			# fileNameList.append(dir+'/'+lines[:-1])
			fileNameList.append(lines[:-1])
	file_to_read.close()

	# fileNameList=['aapl.us.txt','intc.us.txt','gt.us.txt','csx.us.txt','mat.us.txt']
	sc=SparkContext(appName='1')
	files_rnn=sc.parallelize(fileNameList)
	data_rnn=files_rnn.map(compute)
	data=data_rnn.collect()
	print '*******************************************'
	print data
	# raw_input()
