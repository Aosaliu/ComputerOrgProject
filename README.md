#Computer Organization (CSE341)

Implemention of the calculator, hamming distance formula, and euclidean distance formula in Assembly Language.

### Hamming Distance
Hamming distance is a metric for comparing two binary data strings. While comparing two binary strings of equal length, Hamming distance is the number of bit positions in which the two bits are different.
It is used for error detection or error correction when data is transmitted over computer networks. It is also using in coding theory for comparing equal length data words.

#### Example 
Suppose there are two strings 1101 1001 and 1001 1101.

11011001 + 10011101 = 01000100. 
Since, this contains two 1s, the Hamming distance, d(11011001, 10011101) = 2.

### Euclidean Distance
Euclidean Distance is the distance between two points in the plane.
The formula is : 
               dist((x, y), (a, b)) = √(x - a)² + (y - b)²

##### Example
The Euclidean distance between points (2, -1) and (-2, 2): 

dist((2, -1), (-2, 2))	= √(2 - (-2))² + ((-1) - 2)²
 	 	= √(2 + 2)² + (-1 - 2)²
 	 	= √(4)² + (-3)²
 	 	= √16 + 9
 	 	= √25
 	 	= 5.


