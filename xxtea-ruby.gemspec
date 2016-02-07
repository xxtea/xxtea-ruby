Gem::Specification.new do |s|
  s.name        = 'xxtea-ruby'
  s.version     = '1.0.0'
  s.license     = 'MIT'
  s.author      = 'Ma Bingyao ( andot )'
  s.email       = 'mabingyao@gmail.com'
  s.homepage    = 'https://github.com/xxtea/xxtea-ruby'
  s.platform    = Gem::Platform::RUBY
  s.description = <<-EOF
  XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.

  It is different from the original XXTEA encryption algorithm. It encrypts and decrypts raw binary data instead of 32bit integer array, and the key is also the raw binary data.
EOF

  s.summary     = 'XXTEA is a fast and secure encryption algorithm. This is a XXTEA library for Ruby.'
  candidates    = Dir.glob '{test,lib}/**/*'
  candidates   += Dir.glob '*'
  s.files       = candidates.delete_if { |item|
                    item.include?('CVS') || item.include?('rdoc') ||
                    item.include?('nbproject') ||
                    File.extname(item) == '.spec' ||
                    File.extname(item) == '.gem'
  }
  s.require_path = 'lib'
  s.extensions   = ["ext/xxtea/extconf.rb"]
  s.has_rdoc     = false
end
