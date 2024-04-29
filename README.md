# Account Key Calculation Program
## Overview
This program is designed to calculate keys for account numbers based on specified calculations. It reads account numbers from an input file, performs the necessary calculations, and generates output files containing the calculated keys and any encountered errors.
## File Structure
Input File (TAB-NUM.txt):
Contains account numbers to be processed.
Output File (TAB-NUM-SORTIE2.txt):
Contains the calculated keys corresponding to each account number.
Error File (TAB-NUM-ERREURS2.txt):
Records any errors encountered during processing, along with details of the erroneous records
## Input
- Account numbers are read from the input file (TAB-NUM.txt).
- Each account number must be composed of 10 digits.
- Non-numeric values in the input are considered errors and are recorded in the error file.
- Processing stops when the word "FIN" is encountered in the input.
## Processing
- For each account number, a series of calculations is performed to determine the corresponding key.
- The calculated keys, along with the original account numbers, are written to the output file.
- Errors encountered during processing are recorded in the error file.
## Intermediate Calculations
Detailed calculations for determining the key are implemented in the subroutine CLCCle.
## Program Execution
1- Initialization:
- Open input and output files.
- Initialize counters and flags.
2- Processing:
- Read each account number from the input file.
- Perform calculations to determine the key.
- Write the key and account number to the output file or record errors in the error file.
3- Completion:
- Close all files.
- Display summary information including the number of input records, output records, and encountered errors.
- Terminate the program.
## File Handling
- The program utilizes sequential file handling for input, output, and error files.
- File status codes (L-Fst, L-Fst2, L-Fst3) are used to handle file operations.
## Error Handling
- Errors encountered during file operations or processing are logged in the error file (TAB-NUM-ERREURS2.txt).
- Detailed error messages include the line number of the erroneous record and the record itself.

## Expected Results
For the given input values:
Input Value	Key
0000000000	2
1111111111	8
2222222222	1
3333333333	5
4444444444	6
5555555555	8
6666666666	3
7777777777	5
8888888888	4
9999999999	4
## Conclusion
This program provides a robust solution for calculating keys for account numbers. It efficiently processes large volumes of data, handles errors gracefully, and generates accurate results.
