@ RUN: llvm-mc -triple thumbv8 -mattr=+neon -show-encoding < %s | FileCheck %s

vmaxnm.f32 d4, d5, d1
@ CHECK: vmaxnm.f32 d4, d5, d1 @ encoding: [0x05,0xff,0x11,0x4f]
vmaxnm.f32 q2, q4, q6
@ CHECK: vmaxnm.f32 q2, q4, q6 @ encoding: [0x08,0xff,0x5c,0x4f]
vminnm.f32 d5, d4, d30
@ CHECK: vminnm.f32 d5, d4, d30 @ encoding: [0x24,0xff,0x3e,0x5f]
vminnm.f32 q0, q13, q2
@ CHECK: vminnm.f32 q0, q13, q2 @ encoding: [0x2a,0xff,0xd4,0x0f]

vcvta.s32.f32	d4, d6
@ CHECK: vcvta.s32.f32	d4, d6 @ encoding: [0xbb,0xff,0x06,0x40]
vcvta.u32.f32	d12, d10
@ CHECK: vcvta.u32.f32	d12, d10 @ encoding: [0xbb,0xff,0x8a,0xc0]
vcvta.s32.f32	q4, q6
@ CHECK: vcvta.s32.f32	q4, q6 @ encoding: [0xbb,0xff,0x4c,0x80]
vcvta.u32.f32	q4, q10
@ CHECK: vcvta.u32.f32	q4, q10 @ encoding: [0xbb,0xff,0xe4,0x80]

vcvtm.s32.f32	d1, d30
@ CHECK: vcvtm.s32.f32	d1, d30 @ encoding: [0xbb,0xff,0x2e,0x13]
vcvtm.u32.f32	d12, d10
@ CHECK: vcvtm.u32.f32	d12, d10 @ encoding: [0xbb,0xff,0x8a,0xc3]
vcvtm.s32.f32	q1, q10
@ CHECK: vcvtm.s32.f32	q1, q10 @ encoding: [0xbb,0xff,0x64,0x23]
vcvtm.u32.f32	q13, q1
@ CHECK: vcvtm.u32.f32	q13, q1 @ encoding: [0xfb,0xff,0xc2,0xa3]

vcvtn.s32.f32	d15, d17
@ CHECK: vcvtn.s32.f32	d15, d17 @ encoding: [0xbb,0xff,0x21,0xf1]
vcvtn.u32.f32	d5, d3
@ CHECK: vcvtn.u32.f32	d5, d3 @ encoding: [0xbb,0xff,0x83,0x51]
vcvtn.s32.f32	q3, q8
@ CHECK: vcvtn.s32.f32	q3, q8 @ encoding: [0xbb,0xff,0x60,0x61]
vcvtn.u32.f32	q5, q3
@ CHECK: vcvtn.u32.f32	q5, q3 @ encoding: [0xbb,0xff,0xc6,0xa1]

vcvtp.s32.f32	d11, d21
@ CHECK: vcvtp.s32.f32	d11, d21 @ encoding: [0xbb,0xff,0x25,0xb2]
vcvtp.u32.f32	d14, d23
@ CHECK: vcvtp.u32.f32	d14, d23 @ encoding: [0xbb,0xff,0xa7,0xe2]
vcvtp.s32.f32	q4, q15
@ CHECK: vcvtp.s32.f32	q4, q15 @ encoding: [0xbb,0xff,0x6e,0x82]
vcvtp.u32.f32	q9, q8
@ CHECK: vcvtp.u32.f32	q9, q8 @ encoding: [0xfb,0xff,0xe0,0x22]
