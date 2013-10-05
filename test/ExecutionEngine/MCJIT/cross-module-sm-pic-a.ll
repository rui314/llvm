; RUN: %lli_mcjit -extra-modules=%p/cross-module-b.ir -relocation-model=pic -code-model=small %s > /dev/null
; XFAIL: mips, i686, i386, aarch64, arm

declare i32 @FB()

define i32 @FA() {
  ret i32 0
}

define i32 @main() {
  %r = call i32 @FB( )   ; <i32> [#uses=1]
  ret i32 %r
}

