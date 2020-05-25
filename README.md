# Enigma

This was the final project for Mod 1 at the Turing School of Software & Design. The goal was to be able to encrypt and decrypt messages. For testing, we were given two paragraphs - one to encrypt, and one to decrypt - with the expected results given to us as well.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Installation
From your terminal, go to the folder you want to install this project in, then run this command:

```
git clone https://github.com/benfox1216/enigma.git
```

Make sure Ruby 2.5.7 is installed. Install Bundler, then run it to install the remaining gems in the gemfile:

```
gem install bundler
bundle install
```

## Testing

You can run the test suite by running `rake test`.

These test the encryption and the decryption features, with edge cases accounted for. It also tests the enigma decrypt/encrypt methods separately, also with edge cases accounted for. While the usage commands use today's date, it can also work using a random date.

You will also have the ability to utilize `binding.pry` to pry into the code contained in the lib folder, and the tests in the test folder. You can also pry into the encrypt.rb and decrypt.rb files by running the usage commands below with a pry added.

All 43 assertions should pass, with 100% test coverage.

## Usage

To see it in action, run the following command, and it will encrypt the message contained in the message.txt file, and save it to a new file called encrypted.txt:

```
ruby ./lib/encrypt.rb message.txt encrypted.txt
```

It will print a message confirming this has happened, and also give you an automatically generated key and today's date in 6-digit format for decryption.

Example: `Created 'encrypted.txt' with the key 67939 and date 250520`

Now run this next command to decrypt the message that was saved in the encrypted.txt file, using the random key and the date from the last output. The decrypted message will be saved in a new file called decrypted.txt:

*Note: "(key given)" and "(date given)" reference the ones given as the output to the encryption command*

```
ruby ./lib/decrypt.rb encrypted.txt decrypted.txt (key given) (date given)
```

You should now have an encrypted.txt file with the encrypted message, and a decrypted file with the decrypted message, which should be the exact same as the original message in message.txt (except all letters will be lowercase).