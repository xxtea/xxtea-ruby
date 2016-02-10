module XXTEA
  VERSION = "1.3.0"
end

if !defined?(JRUBY_VERSION) then
  require "xxtea/xxtea"
else
  require "xxtea/xxtea_ffi"
end
