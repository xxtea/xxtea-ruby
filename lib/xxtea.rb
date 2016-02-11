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

module XXTEA
  VERSION = "1.3.0"
end

if defined?(JRUBY_VERSION) then
  require "xxtea/xxtea"
else
  require "xxtea/xxtea_ruby"
end
