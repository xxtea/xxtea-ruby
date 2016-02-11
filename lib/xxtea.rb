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
# LastModified: Feb 11, 2016                               #
#                                                          #
############################################################

if !defined?(JRUBY_VERSION) then
  require "xxtea/xxtea"
else
  require "xxtea/xxtea_ruby"
end

module XXTEA
  VERSION = "1.3.0"
  if RUBY_VERSION >= "1.9.0" then
    def decrypt_utf8(data, key)
      decrypt(data, key).force_encoding(Encoding::UTF_8)
    end
  else
    alias :decrypt_utf8 :decrypt
  end
end
