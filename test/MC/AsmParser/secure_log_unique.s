// REQUIRES: shell
// RUN: rm -f %t
// RUN: AS_SECURE_LOG_FILE=%t llvm-mc -triple x86_64-apple-darwin %s
// RUN: AS_SECURE_LOG_FILE=%t llvm-mc -triple x86_64-apple-darwin %s
// RUN: FileCheck --input-file=%t %s
.secure_log_unique "foobar"

// CHECK: "foobar"
// CHECK-NEXT: "foobar"

