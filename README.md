## Print Vowel Documentation

![printvowellogo](Screenshot (52).png)

### What is Print Vowel?

Print Vowel is an assembly language program that takes user input and prints the vowels. The simulator will take the input and print a series of vowels and underscores in place of consonants. It uses the LC-3 instruction set architecture (ISA) and assembly language to do this. 

### Software Needed

The following softwares are required to run Print Vowel. The assembler and simulator can be downloaded from the github repository [here](https://github.com/KaylaFriend/PrintVowel.git).

* A [java runtime environment](https://www.java.com/en/download/windows_manual.jsp?locale=en) (JRE)
* The LC-3 assembler
![assembler](Screenshot (56).png)
* The LC-3 simulator
![simulator](Screenshot (57).png)

### Install and Use

**To use Print Vowel make sure you install the required pieces described in the previous section. **

* The last piece you need is the file letters.asm which is located in the github repository [here](https://github.com/KaylaFriend/PrintVowel.git).

* To use Print Vowel, you will need to open letters.asm in the assembler. 

* Then you will click "reload and assemble." When you assemble the letters.asm file, it will create a new file called letters.hex. 

* Next you will open the simulator and locate the file button in the top left corner. Click open and choose the letters.hex file. 

* Now the simulator is loaded with letters.hex, so you can click the "continue" button in the bottom right corner. 

* At this point the program should be running and you can type your input.
 
* When you have typed all that you want to, you just have to hit the enter button. Now your output should be displayed.


### Troubleshooting

* The assembler will not assemble the file.

More than likely the original letters.asm file has a small adjustment that has been accidentally made. The assembler will give you a line that the error occured on, so check and see if there is any stray letters or marks in the file. 

* The line of the error that the assembler provides is not wrong.

This happens sometimes. Check the line that the assembler provides and the lines above and below it for errors. 

### Support or Contact

If you have any suggestions or difficulties with the program, please contact me at friendka@appstate.edu. I will get back to you as soon as I can and we will get the issue resolved :)
