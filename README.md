## HQ9Perl

HQ9Perl is a simple HQ9+ interpreter written in Perl. 

## Background

HQ9+ is an esoteric programming language created by Cliff L Biffle. It consists of only four instructions:

H : Print "Hello World!"
Q : Print the program's source code (quine)
9 : Print the full lyrics to "99 Bottles of Beer"
+ : Increment the accumulator. This variable serves no purpose and cannot be accessed by the user in any way.

Any other characters (including whitespace) are illegal. Comments are not supported


HQ9+ is technically a programming language in the same way a Subaru Baja is technically a truck. It cannot be used in any meaningful way and its existence is inherently a joke.

More Information:
[http://cliffle.com/esoterica/hq9plus.html](http://cliffle.com/esoterica/hq9plus.html)
[http://esolangs.org/wiki/HQ9+](http://esolangs.org/wiki/HQ9+)

## Dependencies

Requires Perl (obviously). 

### Environments confirmed to work
* ActivePerl 5.20.1 on Windows 10

## Run

Usage: `$ perl HQ9.pl input_file`

Includes a test source file (sample.hq9), containing the following code:
```
QQ+QQHH9HQ
H9HHQHHH+Q
```
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