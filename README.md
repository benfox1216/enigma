# Enigma Self Assessment - Ben Fox

## Overall Score: 3.6

### Functionality: 3

I implemented the encrypt/decrypt methods in the Enigma class successfully, and set up the command line interfaces. Everything works as it's supposed to. While I spent time working on Iteration 4, I did not get the crack method working.

### Object Oriented Programming: 4

I implemented a module that contained methods useful for both the encryption & decryption classes, thus avoiding having to repeat the code for them. I also wrote those methods in a way that took into account which class was using them.

### Ruby Conventions and Mechanics: 4

I made sure to name my classes, methods and variables in a readable manner that made it easy to determine what their responsibilities were. The code is properly indented, and the syntax is consistent. My methods are no more than 10 lines, and I believe I used the correct enumerables for the given situations, and can speak as to why I chose them. I also used a hash in a logical way that helped a lot with making the data useful.

### Test Driven Development: 3

I did not get around to adding mocks or stubs, so that knocks it out of being a 4. However every method is tested, and because I followed SRP, each method had a single responsibility whose output was tested. Edge cases are addressed, such as capital letters and any character not a lowercase letter or a space. I wrote my tests prior to writing code, and my coverage is at 100%.

### Version Control: 4

I have over 50 commits, well over the required 40 for a score of 4. My pull requests contain related and logical chunks of code, well defined by the branches I used, and I documented each one with an explanation of what it contains. Commits do not include multiple pieces of functionality, and the messages are well written to describe what work was done.
