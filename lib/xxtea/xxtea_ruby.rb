############################################################
#                                                          #
# xxtea_ruby.rb                                            #
#                                                          #
# XXTEA encryption algorithm library for Ruby.             #
#                                                          #
# Encryption Algorithm Authors:                            #
#      David J. Wheeler                                    #
#      Roger M. Needham                                    #
#                                                          #
# Code Author: Ma Bingyao <mabingyao@gmail.com>            #
# LastModified: Feb 11, 2016                               #
#                                                          #
############################################################
module XXTEA

  private
  DELTA = 0x9e3779b9

  extend self

  def uint32_array_to_bytes(v, w)
    n = (v.size - 1) << 2
    if w then
      m = v.last
      return '' if (m < n - 3) or (m > n)
      n = m
    end
    s = v.pack("V*")
    w ? s[0, n] : s
  end

  def bytes_to_uint32_array(s, w)
    n = s.bytesize
    v = s.ljust((4 - (n & 3) & 3) + n, "\0").unpack("V*")
    v[v.size] = n if w
    v
  end

  if RUBY_VERSION >= "1.9.0" then
    def str_to_uint32_array(s, w)
      s = String.new(s).force_encoding(Encoding::BINARY) if (s.encoding != Encoding::BINARY)
      bytes_to_uint32_array(s, w)
    end
  else
    alias :str_to_uint32_array :bytes_to_uint32_array
  end

  def mx(sum, y, z, p, e, k)
    ((z >> 5 ^ y << 2) + (y >> 3 ^ z << 4)) ^ ((sum ^ y) + (k[p & 3 ^ e] ^ z))
  end

  def encrypt_uint32_array(v, k)
    n = v.size - 1
    z = v[n]
    y = 0
    sum = 0
    (6 + 52 / (n + 1)).downto(1) {
      sum = (sum + DELTA) & 0xffffffff
      e = (sum >> 2) & 3
      for p in (0...n)
        y = v[p + 1]
        z = v[p] = (v[p] + mx(sum, y, z, p, e, k)) & 0xffffffff
      end
      y = v[0]
      z = v[n] = (v[n] + mx(sum, y, z, n, e, k)) & 0xffffffff
    }
    return v
  end

  def decrypt_uint32_array(v, k)
    n = v.size - 1
    z = 0
    y = v[0]
    sum = ((6 + 52 / (n + 1)) * DELTA) & 0xffffffff
    while (sum != 0)
      e = sum >> 2 & 3
      n.downto(1) { |p|
        z = v[p - 1]
        y = v[p] = (v[p] - mx(sum, y, z, p, e, k)) & 0xffffffff
      }
      z = v[n]
      y = v[0] = (v[0] - mx(sum, y, z, 0, e, k)) & 0xffffffff
      sum = (sum - DELTA) & 0xffffffff
    end
    return v
  end

  public

  def encrypt(data, key)
    return '' if data.nil? or data.empty?
    v = str_to_uint32_array(data, true)
    k = str_to_uint32_array(key.ljust(16, "\0"), false)
    uint32_array_to_bytes(encrypt_uint32_array(v, k), false)
  end

  def decrypt(data, key)
    return '' if data.nil? or data.empty?
    v = str_to_uint32_array(data, false)
    k = str_to_uint32_array(key.ljust(16, "\0"), false)
    uint32_array_to_bytes(decrypt_uint32_array(v, k), true)
  end

  if RUBY_VERSION >= "1.9.0" then
    def decrypt_utf8(data, key)
      decrypt(data, key).force_encoding(Encoding::UTF_8)
    end
  else
    alias :decrypt_utf8 :decrypt
  end
end
