#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

uint8_t *bytes, pos;

SV* read_undef(void) { return newSV(0); }

SV* read_bool_true(void) { return newSVuv(1); }

SV* read_bool_false(void) { return newSVuv(0); }

SV* read_byte(void) { return newSViv( (int8_t) bytes[pos++] ); }

SV* read_short(void) {
    return newSViv( (int16_t) ( ( bytes[pos++] << 8 ) | bytes[pos++] ) );
}

SV* read_double(void) { return newSVuv(0); }

SV* read_int(void) {
    // This is from network (big) endian to intel (little) endian.
    // TODO test/write alternative for POWER PC (big)
    return newSViv( (int32_t) ( ( bytes[pos++] << 24 ) |
                                ( bytes[pos++] << 16 ) |
                                ( bytes[pos++] << 8  ) |
                                ( bytes[pos++] ) ) );
}

SV* read_long(void) {
    return newSViv( (int64_t) ( ( bytes[pos++] << 56 ) |
                                ( bytes[pos++] << 48 ) |
                                ( bytes[pos++] << 40 ) |
                                ( bytes[pos++] << 32 ) |
                                ( bytes[pos++] << 24 ) |
                                ( bytes[pos++] << 16 ) |
                                ( bytes[pos++] << 8  ) |
                                ( bytes[pos++] ) ) );
}

SV *(*dispatch[8])(void) = {
    read_undef,
    read_bool_true,
    read_bool_false,
    read_byte,
    read_short,
    read_double,
    read_int,
    read_long
};

MODULE = JavaBin PACKAGE = JavaBin

SV *from_javabin(input)
    unsigned char *input
    PROTOTYPE: $
    CODE:
        bytes = input;
        pos = 1;

        RETVAL = dispatch[bytes[pos++]]();
    OUTPUT: RETVAL
