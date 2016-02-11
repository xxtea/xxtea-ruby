############################################################
#                                                          #
# xxtea_ffi.rb                                            #
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

require "ffi"

module FFI
  class Pointer
    type = FFI.find_type(:size_t)
    type, _ = FFI::TypeDefs.find do |(name, t)|
      method_defined? "read_#{name}" if t == type
    end
    alias_method :read_size_t, "read_#{type}" if type
  end
end

module XXTEA
  private
  module LIB
    extend FFI::Library
    ffi_lib File.dirname(__FILE__) + '/xxtea.' + (RUBY_PLATFORM=~/darwin/ ? 'bundle' : 'so')
    attach_function :xxtea_encrypt, [:pointer, :size_t, :pointer, :pointer], :pointer
    attach_function :xxtea_decrypt, [:pointer, :size_t, :pointer, :pointer], :pointer
    attach_function :free, [:pointer], :void
  end
  public
  module_function
  def encrypt(data, key)
    return nil if data.nil?
    data_len = data.bytesize
    data = FFI::MemoryPointer.from_string(data)
    key = FFI::MemoryPointer.from_string(key)
    out_len = FFI::MemoryPointer.new(:size_t, 1)
    result = LIB.xxtea_encrypt(data, data_len, key, out_len)
    return nil if result.null?
    retval = result.read_bytes(out_len.read_size_t)
    LIB.free(result)
    return retval
  end
  def decrypt(data, key)
    return nil if data.nil?
    data_len = data.bytesize
    data = FFI::MemoryPointer.from_string(data)
    key = FFI::MemoryPointer.from_string(key)
    out_len = FFI::MemoryPointer.new(:size_t, 1)
    result = LIB.xxtea_decrypt(data, data_len, key, out_len)
    return nil if result.null?
    retval = result.read_bytes(out_len.read_size_t)
    LIB.free(result)
    return retval
  end

  if RUBY_VERSION >= "1.9.0" then
    def decrypt_utf8(data, key)
      decrypt(data, key).force_encoding(Encoding::UTF_8)
    end
  else
    alias_method :decrypt_utf8, :decrypt
  end
end
