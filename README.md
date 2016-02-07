# XXTEA for Ruby

[![Build Status](https://travis-ci.org/xxtea/xxtea-ruby.svg?branch=master)](https://travis-ci.org/xxtea/xxtea-ruby)

## Introduction

XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.

It is different from the original XXTEA encryption algorithm. It encrypts and decrypts raw binary data instead of 32bit integer array, and the key is also the raw binary data.

## Installation

```sh
gem install xxtea-ruby
```

## Usage

```ruby
# encoding: utf-8
require "xxtea"
text = "Hello World! 你好，中国！"
key = "1234567890"
encrypt_data = XXTEA.encrypt(text, key)
decrypt_data = XXTEA.decrypt_utf8(encrypt_data, key)
puts (text == decrypt_data ? "success!" : "fail!");
```

```ruby
XXTEA.decrypt_utf8(encrypt_data, key) == XXTEA.decrypt(encrypt_data, key).force_encoding(Encoding::UTF_8)
```

## Note

There is no decrypt_utf8 function in ruby 1.8.x or lower version.
