############################################################
#                                                          #
# xxtea.rb                                                 #
#                                                          #
# XXTEA encryption algorithm library for Ruby.             #
#                                                          #
# Encryption Algorithm Authors:                            #
#      David J. Wheeler                                    #
#      Roger M. Needham                                    #
#                                                          #
# Code Author: Ma Bingyao <mabingyao@gmail.com>            #
# LastModified: Feb 12, 2016                               #
#                                                          #
############################################################

if File.exists?(File.dirname(__FILE__) + '/xxtea.' + (RUBY_PLATFORM=~/darwin/ ? 'dylib' : RUBY_PLATFORM=~/win32|w32/ ? 'dll' : 'so')) then
  if !defined?(JRUBY_VERSION) then
    require "xxtea/xxtea"
  else
    require "xxtea/xxtea_ffi"
  end
else
  require "xxtea/xxtea_ruby"
end

module XXTEA
  extend self
  VERSION = "1.3.0"
  if RUBY_VERSION >= "1.9.0" then
    def decrypt_utf8(data, key)
      decrypt(data, key).force_encoding(Encoding::UTF_8)
    end
  else
    def decrypt_utf8(data, key)
      decrypt(data, key)
    end
  end
end
