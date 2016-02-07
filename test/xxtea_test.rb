require "minitest/autorun"
require "xxtea"

describe "XXTEA" do
    it "test xxtea encrypt and decrypt" do
        text = "Hello World! 你好，中国！"
        key = "1234567890"
        encrypt_data = XXTEA.encrypt(text, key)
        decrypt_data = XXTEA.decrypt_utf8(encrypt_data, key)
        decrypt_data2 = XXTEA.decrypt(encrypt_data, key).force_encoding(Encoding::UTF_8)
        assert_equal text, decrypt_data
        assert_equal decrypt_data, decrypt_data2
    end
end
