# SUTD-50.002-Full adder tester

### Team members
- Jason Julian
- Lim Ying Jie
- Joshua Lim

MOJO v3 project + IO shield add-on

Written in Lucid and compiled to Verilog by Mojo IDE.
The FPGA emulates a mojo and shows the expected results on the clear LED screen.

It takes in inputs from the adder circuit, detects the voltage and determines whether the adder is working properly by comparing to the boolean expression of an optimal full adder

Press center button for automated testing.
The mojo will cycle through different test cases and determine whether the adder is working as expected. The test will end prematurely if there is a failure.

The first three switches in the right array can be used for manual testing.

The tester sends high or low voltages depending on the state of dip switches that correspond to A,B,Cin.
  It then reads the voltage near the LED and determines whether the voltage matches the expected result based
  on the boolean expression of a full adder.
   
  Results are displayed in the 7 segment LED in the format of 
   
  __________    ____________    ______________    ______________
   Real Sum     Expected Sum    Real CarryOut    Expected CarryOut
   
   If the results matches, the middle LED strip on the IO shield will light up. Indicating a match.
   However, if a single test case fail, the automated test will stop.

Pins used are 
- Pin 15 for A
- Pin 16 for B
- Pin 17 for Carry in
- Pin 21 for Sum
- Pin 22 for Carry out

