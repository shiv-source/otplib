# otplib
Time-based (TOTP) and HMAC-based (HOTP) One-Time Password library







## About

`otplib` is another node based One Time Password (OTP) Library.
It was initially created for me to understand how One Time Passwords work in implementation.

It implements:

 * [RFC 4226](http://tools.ietf.org/html/rfc4226) - [HOTP](http://en.wikipedia.org/wiki/HMAC-based_One-time_Password_Algorithm)
 * [RFC 6238](http://tools.ietf.org/html/rfc6238) - [TOTP](http://en.wikipedia.org/wiki/Time-based_One-time_Password_Algorithm)

This library is compatible with [Google Authenticator](http://code.google.com/p/google-authenticator/), and includes additional
methods to allow you to easily work with Google Authenticator.







## Installation
Install the module with: `npm install otplib`

```javascript
var otplib = require('otplib');
```






## Quick Start

### Token Generation
```javascript
var otplib = require('otplib');

// Basic
var secret = 'user secret' || otplib.core.secret(),
    qrcode = otplib.core.qrcode('user', 'domain', secret);

// Generating OTP
var code = otplib.core.totp(secret);

console.log('OTP: ' + code);
```


### Token Validation

```javascript
var otplib = require('otplib');

// From database etc.
var secret = 'user secret',
    code = 'user provided OTP';

// True / False
var status = otplib.google.check(code, secret);

console.log('Is Token Valid: ' + status);
```





## Google Authenticator

### Base32 Keys

Google Authenticator requires keys to be base32 encoded.

### RFC3548

Google Authenticator requires an [RFC 3548](http://tools.ietf.org/html/rfc3548) compliant encoder.

OTP calculation will still work should you want to use other base32 encoding methods (like Crockford's Base 32)
but it will NOT be compatible with Google Authenticator.

### GAuth Sample

```javascript
var otplib = require('otplib');

var secret = 'base 32 encoded user secret' || otplib.google.secret(),
    qrcode = otplib.core.qrcode('user', 'domain', secret);

var code = otplib.google.generate(secret);

console.log('OTP: ' + code);
```





## Documentation

All examples assumes `var otplib = require('otplib');` as base.


### Core [`otplib.core.METHOD`]

#### `hotp(secret, counter)`
HMAC based OTP

  * `secret` (_**string**_) _user secret_
  * `counter` (_**integer**_)



#### `totp(secret)`
Time based OTP

  * `secret` (_**string**_) _user secret_



#### `secret.generate(radix)`
 Generate a random secret

 * radix (_**string**_) [optional]



#### `helpers.stringToHex(value)`  
Converts String to Hex

  * `value` (_**string**_)



#### `helpers.hexToInt(hex)`
Converts Hex into an Integer

 * `hex` (_**string**_) _hexadecimal string_



#### `helpers.intToHex(number)`
Parse number into an Integer and convert to Hex

 * `number` (_**string/integer**_) _parseInt(base 10) will be called on the number_



#### `helpers.pad(value, total)`
Do a left padding of the value based on the total

 * `value` (_**string**_) _string to pad_
 * `total` (_**string**_) _total number of characters in string_




### googleAuthenticator [`otplib.google.METHOD`]

`debug(status)`
Sets debug message printouts

 * `status` (_**boolean**_) _true/false_



`secret()`
Generate a secret


`keyuri(user, host, secret)`
Key-uri _eg. outauth://totp/user:localhost?secet=NKEIBAOUFA_

 * `user` (_**string**_) _eg. joe_
 * `host` (_**string**_) _eg. github.com_
 * `secret` (_**string**_) _user secret_


`qrcode(user, host, secret)`
Generates a QR Code image using Google Charts

 * `user` (_**string**_) _eg. joe_
 * `host` (_**string**_) _eg. github.com_
 * `secret` (_**string**_) _user secret_



`generate(secret)`
Generate One Time Pass

 * `secret` (_**string**_) _user secret_



`check(token, secret)`
Check for token validity

 * `token` (_**string**_) _user provided one time pass_
 * `secret` (_**string**_) _user secret_



`encode(secret)`
Base32 encoding

 * `secret` (_**string**_) _user secret_



`decode(secret)`
Base32 decoding

 * `secret` (_**string**_) _user secret_








## Release History

| Version    | Notes       |
|:-----------|:------------|
| 0.0.3      | Version Bump for publish |
| 0.0.2      | API movement |
| 0.0.1      | First Release |





## License
Copyright (c) 2014 Gerald Yeo. Licensed under the MIT license.
