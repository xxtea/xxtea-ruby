# XXTEA for Ruby

## Introduction

XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.

It is different from the original XXTEA encryption algorithm. It encrypts and decrypts raw binary data instead of 32bit integer array, and the key is also the raw binary data.

## Installation

```sh
gem install xxtea
```

## Usage

```ruby
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
