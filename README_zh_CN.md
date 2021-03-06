# XXTEA 加密算法的 Ruby 实现

<a href="https://github.com/xxtea/">
    <img src="https://avatars1.githubusercontent.com/u/6683159?v=3&s=86" alt="XXTEA logo" title="XXTEA" align="right" />
</a>

[![Build Status](https://travis-ci.org/xxtea/xxtea-ruby.svg?branch=master)](https://travis-ci.org/xxtea/xxtea-ruby)
[![Gem](https://img.shields.io/gem/v/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gem](https://img.shields.io/gem/dt/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gem](https://img.shields.io/gem/dtv/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gems](https://img.shields.io/gem/rt/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)
[![Gems](https://img.shields.io/gem/rd/xxtea-ruby.svg)](https://rubygems.org/gems/xxtea-ruby)

## 简介

XXTEA 是一个快速安全的加密算法。本项目是 XXTEA 加密算法的 Ruby 实现。

它不同于原始的 XXTEA 加密算法。它是针对原始二进制数据类型进行加密的，而不是针对 32 位 int 数组。同样，密钥也是原始二进制数据类型。

## 安装

```sh
gem install xxtea-ruby
```

## 使用

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

## 注意

在 1.8.x 或更低版本的 Ruby 上，decrypt_utf8 只是 decrypt 的一个别名。
