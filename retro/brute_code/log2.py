import math

N = 8

def binlog2(X, N):
    i = N/2 - 1
    k = N
    V = 1

    res=""


    while k != 0:

        sV = V
        V  = V * ((2**(2**i)))
        i  = i-1
        k  = k-1
        
        C=(X >= V)
        # print (i, k, V, C)

        if C :
            # print (f"a{k} = 1")
            res += '1'
        else:
            # print (f"a{k} = 0")
            res += '0'
            # restore V
            V = sV
    return (res)

X = 12
res = binlog2(X, N)
print (int(res,2), math.log2(X)*(2**(N/2)))

# for i in range(2, 2**N):
#     print (i, int(binlog2(i, N),2), math.log2(i)*(2**(N/2)), math.log2(i)*(2**(N))/N)
    
# print (bin(int(math.log2(X)*(2**N)))[2:])
# print (bin(int(math.log2(X)*(2**N)/N))[2:])


##print (i, k, V, C)
##
##i=i-1
##k=k-1
##if C :
##    print (f"a{k} = 1")
##    V = V*(2**(2**i))
##else:
##    print (f"a{k} = 0")
##    V = V * (2**(2**i)) / (2**(2**(i+1)))
##C=(X >= V)
##
##print (i, k, V, C)
##
##i=i-1
##k=k-1
##if C :
##    print (f"a{k} = 1")
##    V = V*(2**(2**i))
##else:
##    print (f"a{k} = 0")
##    V = V * (2**(2**i)) / (2**(2**(i+1)))
##C=(X >= V)
##
##print (i, k, V, C)
##
##i=i-1
##k=k-1
##if C :
##    print (f"a{k} = 1")
##    V = V*(2**(2**i))
##else:
##    print (f"a{k} = 0")
##    V = V * (2**(2**i)) / (2**(2**(i+1)))
##C=(X >= V)
##
##print (i, k, V, C)
