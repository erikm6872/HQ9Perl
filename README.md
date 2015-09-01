## HQ9Perl

As the name implies, HQ9Perl is a simple HQ9+ interpreter written in Perl. 

## Background

HQ9+ is an esoteric programming language created by Cliff L Biffle. It consists of only four instructions:

* H : Print "Hello World!"
* Q : Print the program's source code (quine)
* 9 : Print the full lyrics to "99 Bottles of Beer"
* + : Increment the accumulator. This variable serves no purpose and cannot be accessed.

Any characters other than the four listed above (including whitespace) are illegal. **This means that comments are not supported in any way.**

HQ9+ is technically a programming language in the same way a Subaru Baja is technically a truck. It cannot be used in any meaningful way and its existence is inherently a joke.

More Information:
* [http://cliffle.com/esoterica/hq9plus.html](http://cliffle.com/esoterica/hq9plus.html)
* [http://esolangs.org/wiki/HQ9+](http://esolangs.org/wiki/HQ9+)

## Dependencies

**Requires the Perl Switch module.** You can install it by running the following commands.
* ActivePerl(Windows)
  * `>ppm install Switch`
* apt-get(Raspbian/Ubuntu)
  * `$ sudo apt-get install libswitch-perl`

**Environments confirmed to work**
* ActivePerl 5.20.1 on Windows 10
* Perl version 5.14.2 on Raspbian Wheezy

## Run/Test

Usage: `$ perl HQ9.pl input_file`

Includes a test source file (sample.hq9), containing the following code:
```
QQ+QQHH9HQ
H9HHQHHH+Q
```

Using the test file: `$ perl HQ9.pl sample.hq9`

Input files need to be UTF-8 encoded plain text. `*.hq9` extension is recommended, but not required. 

## Contributors

Erik McLaughlin (http://github.com/erikm6872)

## License

The MIT License (MIT)

Copyright (c) 2015 Erik C McLaughlin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
