# encoding: utf-8
require "minitest/autorun"
require "xxtea_ffi"

describe "xxtea_ffi" do
    it "test xxtea encrypt and decrypt" do
        text = "Hello World! \0你好，中国！"
        key = "1234567890"
        encrypt_data = XXTEA.encrypt(text, key)
        if RUBY_VERSION >= "1.9.0" then
            decrypt_data = XXTEA.decrypt_utf8(encrypt_data, key)
            decrypt_data2 = XXTEA.decrypt(encrypt_data, key).force_encoding(Encoding::UTF_8)
            assert_equal text, decrypt_data
            assert_equal decrypt_data, decrypt_data2
        else
            decrypt_data = XXTEA.decrypt(encrypt_data, key)
            assert_equal text, decrypt_data
        end
    end
end
