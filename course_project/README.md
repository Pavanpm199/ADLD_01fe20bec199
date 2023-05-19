#### **Problem Statement: Single Bit Error Correction and Detection using Hamming Code** 

<br/> 
Hamming Code: Hamming code is an error-detection method that
can detect some errors, but it is only capable of
single error correction . This error detection
method is suitable for use in situations where there
is few randomized mistake. Method Hamming
Code inserts (n + 1) check bits into 2n data bits.
This method uses XOR (Exclusive - OR) in the
error detection process

## Architecture
![architecture](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/4a53bb7c-d7be-47f5-a41d-eb820692399b)

# Encoder
The encoder takes a 128-bit input data and generates a 136-bit output data with 8 parity bits.
The encoder works as follows:
* The input data is first checked for parity.If any of the 8 parity bits is incorrect,the encoder will add the necessary parity bits to make the data correct.
* After the input data has been verified to have correct parity,the encoder will add 8 parity bits to the data to generate the output data.

# Decoder:

* The decoder receives  a serial input of data and calculates parity bits .

* After calculating parity bits,it tries to match bits to value zero.If the equals to zero, it means that there is no error in received data and transmit the same data.

* If not equal  to zero then ,it flips that bit to either from 0 to 1 or from 1 to 0 depending on the value of parity in that location.

* After flipping the bit,in the  data extraction stage original data and parity bits are separated and original data is transmitted to output port.
