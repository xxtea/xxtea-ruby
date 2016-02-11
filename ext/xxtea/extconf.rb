if !defined?(JRUBY_VERSION) then
    require 'mkmf'
    $CFLAGS += ' -g -O3 -Wall '
    create_makefile('xxtea/xxtea')
end
