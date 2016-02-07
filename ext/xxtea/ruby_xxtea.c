/**********************************************************\
|                                                          |
| xxtea.c                                                  |
|                                                          |
| XXTEA encryption algorithm library for Lua.              |
|                                                          |
| Encryption Algorithm Authors:                            |
|      David J. Wheeler                                    |
|      Roger M. Needham                                    |
|                                                          |
| Code Authors: Chen fei <cf850118@163.com>                |
|               Ma Bingyao <mabingyao@gmail.com>           |
| LastModified: Feb 8, 2016                                |
|                                                          |
\**********************************************************/

#include <ruby.h>
#include <ruby/encoding.h>
#include "xxtea.h"

VALUE rb_encrypt(VALUE mod, VALUE data, VALUE key) {
	unsigned char * result;
	VALUE retval;
	size_t data_len, out_len;

	Check_Type(data, T_STRING);
	Check_Type(key, T_STRING);

	data_len = RSTRING_LEN(data);

	result = xxtea_encrypt(RSTRING_PTR(data), data_len, RSTRING_PTR(key), &out_len);

	retval = rb_str_new((const char *)result, out_len);

	free(result);

	return retval;
}

VALUE rb_decrypt(VALUE mod, VALUE data, VALUE key) {
	unsigned char *result;
	VALUE retval;
	size_t data_len, out_len;

	Check_Type(data, T_STRING);
	Check_Type(key, T_STRING);

	data_len = RSTRING_LEN(data);

	result = xxtea_decrypt(RSTRING_PTR(data), data_len, RSTRING_PTR(key), &out_len);

	retval = rb_str_new((const char *)result, out_len);

	free(result);

	return retval;
}

VALUE rb_decrypt_utf8(VALUE mod, VALUE data, VALUE key) {
	return rb_enc_associate(rb_decrypt(mod, data, key), rb_utf8_encoding());
}

void Init_xxtea() {
    VALUE XXTEA = rb_define_module("XXTEA");
    rb_define_singleton_method(XXTEA, "encrypt", rb_encrypt, 2);
    rb_define_singleton_method(XXTEA, "decrypt", rb_decrypt, 2);
	rb_define_singleton_method(XXTEA, "decrypt_utf8", rb_decrypt_utf8, 2);
}
