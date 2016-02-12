if !defined?(JRUBY_VERSION) then
  require 'mkmf'
  $CFLAGS += ' -g -O3 -Wall '
  create_makefile('xxtea/xxtea')
else
  file = File.open('CMakeLists.txt', 'w') do |file|
    file.puts 'project(xxtea)'
    file.puts 'cmake_minimum_required(VERSION 2.6)'
    file.puts 'set(CMAKE_MACOSX_RPATH 1)' if RUBY_PLATFORM=~/darwin/
    file.puts 'set(LIBXXTEA_SRC ' + File.expand_path(File.dirname(__FILE__) + '/xxtea.c') +')'
    file.puts 'add_library(xxtea SHARED ${LIBXXTEA_SRC})'
    file.puts 'install(TARGETS xxtea DESTINATION ' + File.expand_path(File.dirname(__FILE__) + '/../../lib/xxtea') + ')'
  end
  system('cmake -G "Unix Makefiles" .')
end
