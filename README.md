# XXTEA for Ruby

<a href="https://github.com/xxtea/">
    <img src="https://avatars1.githubusercontent.com/u/6683159?v=3&s=86" alt="XXTEA logo" title="XXTEA" align="right" />
</a>

[![Build Status](https://travis-ci.org/xxtea/xxtea-ruby.svg?branch=master)](https://travis-ci.org/xxtea/xxtea-ruby)
[![Gem](https://img.shields.io/gem/v/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gem](https://img.shields.io/gem/dt/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gem](https://img.shields.io/gem/dtv/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gems](https://img.shields.io/gem/rt/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gems](https://img.shields.io/gem/rd/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)

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

decrypt_utf8 is an alias of decrypt in ruby 1.8.x or lower version.
