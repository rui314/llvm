; Test 128-bit addition when the distinct-operands facility is available.
;
; RUN: llc < %s -mtriple=s390x-linux-gnu -mcpu=z196 | FileCheck %s

; Test the case where both operands are in registers.
define i64 @f1(i64 %a, i64 %b, i64 %c, i64 %d, i64 *%ptr) {
; CHECK-LABEL: f1:
; CHECK: algrk %r2, %r4, %r5
; CHECK: alcgr
; CHECK: br %r14
  %x1 = insertelement <2 x i64> undef, i64 %b, i32 0
  %x2 = insertelement <2 x i64> %x1, i64 %c, i32 1
  %x = bitcast <2 x i64> %x2 to i128
  %y2 = insertelement <2 x i64> %x1, i64 %d, i32 1
  %y = bitcast <2 x i64> %y2 to i128
  %add = add i128 %x, %y
  %addv = bitcast i128 %add to <2 x i64>
  %high = extractelement <2 x i64> %addv, i32 0
  store i64 %high, i64 *%ptr
  %low = extractelement <2 x i64> %addv, i32 1
  ret i64 %low
}
