############################################################
#                                                          #
# xxtea/extconf.rb                                         #
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

if !defined?(JRUBY_VERSION) then
  require 'mkmf'
  create_makefile('xxtea/xxtea')
else
  file = File.open('CMakeLists.txt', 'w') do |file|
    file.puts 'project(xxtea)'
    file.puts 'cmake_minimum_required(VERSION 2.6)'
    file.puts 'set(CMAKE_MACOSX_RPATH 1)' if RUBY_PLATFORM=~/darwin/
    file.puts 'set(LIBXXTEA_SRC ' + File.expand_path(File.dirname(__FILE__) + '/xxtea.c') +')'
    file.puts 'add_library(xxtea SHARED ${LIBXXTEA_SRC})'
    file.puts 'set_target_properties(xxtea PROPERTIES PREFIX "")'
    file.puts 'set_target_properties(xxtea PROPERTIES SUFFIX "")'
    if RUBY_PLATFORM=~/darwin/ then
      file.puts 'set_target_properties(xxtea PROPERTIES OUTPUT_NAME "xxtea.bundle")'
    elsif RUBY_PLATFORM=~/win32|w32/ then
      file.puts 'set_target_properties(xxtea PROPERTIES OUTPUT_NAME "xxtea.dll")'
    else
      file.puts 'set_target_properties(xxtea PROPERTIES OUTPUT_NAME "xxtea.so")'
    end
    file.puts 'install(TARGETS xxtea DESTINATION ' + File.expand_path(File.dirname(__FILE__) + '/../../lib/xxtea') + ')'
  end
  system('cmake -G "Unix Makefiles" .')
end
