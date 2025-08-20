import math

def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

# Dummy function: implements round(math.sqrt(v1))
def square_root_4_4(a3, a2, a1, a0):
#def uneFonction(a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 4)


# math.log2((2**4) - 1)*(2**4)/4
def log2_4_4(a3, a2, a1, a0):
    bits = [a3, a2, a1, a0]
    
    def f(i): return min((2**4)-1,round(math.log2((i))*(2**4)/4)) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1)
    # Output as list of bits (LSB first)
    return toBin(mathval1, 4)

def log2_8_8(a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**8)-1,round(math.log2((i))*(2**5))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1)
    # Output as list of bits (LSB first)
    return toBin(mathval1, 8)

def log2_9_9(a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**9)-1,round(math.log2((i))*(((2**9)-1)/9))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1)
    # Output as list of bits (LSB first)
    return toBin(mathval1, 9)

def log2_10_10(a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**10)-1,round(math.log2((i))*(((2**10)-1)/10))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1)
    # Output as list of bits (LSB first)
    return toBin(mathval1, 10)

def log2_10_to_high_6 (a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**10)-1,round(math.log2((i))*(((2**10)-1)/10))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1) // 16 # get rid of 4 LSB
    # Output as list of bits (LSB first)
    return toBin(mathval1, 6)

def log2_12_to_high_6 (a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**12)-1,round(math.log2((i))*(((2**12)-1)/12))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1) // (2**6) # get rid of 6 LSB
    # Output as list of bits (LSB first)
    return toBin(mathval1, 6)

def not_log2_12_to_high_6 (a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**12)-1,round(math.log2((i))*(((2**12)-1)/12))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1) // (2**6) # get rid of 6 LSB
    # Output as list of bits (LSB first)
    return [1-v for v in toBin(mathval1, 6)]

def not_log2_12_to_low_6 (a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**12)-1,round(math.log2((i))*(((2**12)-1)/12))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1) % (2**6) # get rid of 6 MSB
    # Output as list of bits (LSB first)
    return [1-v for v in toBin(mathval1, 6)]

def not_log2_10_10(a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    bits = [a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    
    def f(i): return min((2**10)-1,round(math.log2((i))*(((2**10)-1)/10))) if i != 0 else 0

    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = f(v1)
    # Output as list of bits (LSB first)
    return [1-v for v in toBin(mathval1, 10)]

def square_root_5_5(a4, a3, a2, a1, a0):
# def uneFonction(a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 5)

def square_root_6_6(a5, a4, a3, a2, a1, a0):
# def uneFonction(a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a5, a3, a2, a1, a0)
    bits = [a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 6)

def square_root_7_7(a6, a5, a4, a3, a2, a1, a0):
# def uneFonction(a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a6, a5, a3, a2, a1, a0)
    bits = [a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 7)

def square_root_3_3(a2, a1, a0):
#def uneFonction(a2, a1, a0):
    # args: bits, most significant first (a2, a1, a0)
    bits = [a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 3)


def square_root_8_8(a7, a6, a5, a4, a3, a2, a1, a0):
# def uneFonction(a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 8)

def square_root_9_9(a8, a7, a6, a5, a4, a3, a2, a1, a0):
# def uneFonction(a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 9)

def square_root_10_10(a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
# def uneFonction(a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 10)

def square_root_11_11(a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
# def uneFonction(a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 11)

def square_root_12_12(a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
#def uneFonction(a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 12)



def square_root_16_16(a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 16)



def uneFonctionLourde(a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 16)

def uneFonctionSimple(a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 4)

def uneFonction_treslight(a2, a1, a0):
    # args: bits, most significant first (a2, a1, a0)
    bits = [a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 2)


def test_function(a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    # mathval1 = round(math.sqrt(v1))
    mathval1 = 384+2**6 if v1 == 896 else 0
    # Output as list of bits (LSB first)
    return toBin(mathval1, 9)
