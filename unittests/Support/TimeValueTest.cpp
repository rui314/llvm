//===- llvm/unittest/Support/TimeValueTest.cpp - Time Value tests ---------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "gtest/gtest.h"
#include "llvm/Support/TimeValue.h"
#include <time.h>

using namespace llvm;
namespace {

TEST(TimeValue, time_t) {
  sys::TimeValue now = sys::TimeValue::now();
  time_t now_t = time(NULL);
  EXPECT_TRUE(abs(static_cast<long>(now_t - now.toEpochTime())) < 2);
}

}
