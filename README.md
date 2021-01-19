# enigma

### Scoring

#For functionality I would give myself a 3.5.# I was able to implement everything that was required and it functions properly, the cracking method was implemented, however it does not properly return the key.

#For OOP I would give myself between a 3.5 and a 4.# To the best of my knowledge the single responsibility rule wasn’t broken, and I properly implemented an inheritance.
I broke my project up into the following classes, I had my required Enigma class that's single responsibility was to translate and pass data from the runner files to the proper encipher/decipher class, then back to the runner file. Next I had the CipherEngine class which was the parent class for all three of my coding classes and it handled all of the shared methods between them. The CipherEngines three children were my Encipher class which only deld with enciphering messages passed to it by the Enigma class, the Decipher class does much the same thing, but includes the minor differences required to decipher a coded message. Lastly my CodeBreak class was responsible for codes given without a key. I considered making the CodeBreak class part of or a child of the Decipher class however almost all of their overlap in function was in the CipherEngine class so i decided to make it a direct child.
I also made a decision to handle the reading and writing of files to the runner files as that felt like it was outside of the encoding/decoding responsibilities of the classes

#For ruby convention I would give myself a 3.# I have proper indentation and lines are not too long. Files follow proper naming convention, most of the used enumerables are best case etc. Generally I feel that my code is clean and properly formatted, but in order to meet the interaction pattern, some of my methods and elements feel a bit forced and don't flow as smoothly as I would have liked, and I would have liked to spend some more time refactoring/improving it.

#For TDD I would give a 3.5.# I have100% simplecov coverage and have implemented mocking and stubs. I had a rock start with TDD however. Outside of writing tests based on the interaction pattern I Initially I was feeling a little too overwhelmed to write tests for my code. I spent a while sandboxing ideas until I had a general framework of what I wanted to do. I implemented testing when I had general frameworks for my methods probably around the 50% mark. I used testing to help shape my final code and to ensure that everything was functioning properly, and that I didn't break anything while refactoring

Final score 3.37

### Wins and Challenges

I really enjoyed working on this project and am overall very happy on how it turned out. I am happy with the encapsulation and single responsibility of my code as this was ultimately a win but during the project a challenge that I struggled to parse out properly. Another challenge  was figuring out how to write my enigma class while minimizing repeated code. I did a decent job of minimizing code but feel that a better job could have been done.
