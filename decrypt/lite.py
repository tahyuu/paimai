#!/usr/bin/env python2.7
import struct
# 32-bit unsigned integer
# base 10       2,864,434,397
# base 16       0xAABBCCDD
u32 = 0xAABBCCDD
print 'u32 =', u32, '(0x%x)' % u32
# big endian    0xAA 0xBB 0xCC 0xDD
u32be = struct.pack('>I', u32)
bx = [byte for byte in struct.unpack('4B', u32be)]
print 'big endian packed', ['0x%02x' % x for x in bx]
assert bx == [0xaa, 0xbb, 0xcc, 0xdd]
# little endian 0xDD 0xCC 0xBB 0xAA
u32le = struct.pack('<I', u32)
lx = [byte for byte in struct.unpack('4B', u32le)]
print 'little endian packed', ['0x%02x' % x for x in lx]
assert lx == [0xdd, 0xcc, 0xbb, 0xaa]
# 64-bit unsigned integer
# base 10       12,302,652,060,662,200,000
# base 16       0xAABBCCDDEEFF0011
u64 = 0xAABBCCDDEEFF0011L
print 'u64 =', u64, '(0x%x)' % u64
# big endian    0xAA 0xBB 0xCC 0xDD 0xEE 0xFF 0x00 0x11
u64be = struct.pack('>Q', u64)
bx = [byte for byte in struct.unpack('8B', u64be)]
print 'big endian packed', ['0x%02x' % x for x in bx]
assert bx == [0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x00, 0x11]
# little endian 0x11 0x00 0xFF 0xEE 0xDD 0xCC 0xBB 0xAA
u64le = struct.pack('<Q', u64)
lx = [byte for byte in struct.unpack('8B', u64le)]
print 'little endian packed', ['0x%02x' % x for x in lx]
assert lx == [0x11, 0x00, 0xff, 0xee, 0xdd, 0xcc, 0xbb, 0xaa]
