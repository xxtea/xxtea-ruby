lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'xxtea'

Gem::Specification.new do |s|
  s.name         = 'xxtea-ruby'
  s.version      = XXTEA::VERSION
  s.license      = 'MIT'
  s.author       = 'Ma Bingyao ( andot )'
  s.email        = 'mabingyao@gmail.com'
  s.homepage     = 'https://github.com/xxtea/xxtea-ruby'
  s.platform     = Gem::Platform::RUBY
  s.description  = <<-EOF
  XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.

  It is different from the original XXTEA encryption algorithm. It encrypts and decrypts raw binary data instead of 32bit integer array, and the key is also the raw binary data.
EOF

  s.summary      = 'XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.'
  s.files        = `git ls-files`.split($/)
  s.test_files   = s.files.grep(%r{^test/})
  s.require_path = 'lib'
  s.extensions   = ['ext/xxtea/extconf.rb']

  s.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.10'
  s.requirements << 'cmake'
end
