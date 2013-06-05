//===- YAML.h - YAMLIO utilities for object files ---------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares utility classes for handling the YAML representation of
// object files.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_OBJECT_YAML_H
#define LLVM_OBJECT_YAML_H

#include "llvm/Support/YAMLTraits.h"

namespace llvm {
namespace object {
namespace yaml {

/// In an object file this is just a binary blob. In an yaml file it is an hex
/// string. Using this avoid having to allocate temporary strings.
class BinaryRef {
  /// \brief Either raw binary data, or a string of hex bytes (must always
  /// be an even number of characters).
  ArrayRef<uint8_t> Data;
  /// \brief Discriminator between the two states of the `Data` member.
  bool DataIsHexString;

public:
  BinaryRef(ArrayRef<uint8_t> Data) : Data(Data), DataIsHexString(false) {}
  BinaryRef(StringRef Data)
      : Data(reinterpret_cast<const uint8_t *>(Data.data()), Data.size()),
        DataIsHexString(true) {}
  BinaryRef() : DataIsHexString(true) {}
  StringRef getHex() const {
    assert(DataIsHexString);
    return StringRef(reinterpret_cast<const char *>(Data.data()), Data.size());
  }
  ArrayRef<uint8_t> getBinary() const {
    assert(!DataIsHexString);
    return Data;
  }
  /// \brief The number of bytes that are represented by this BinaryRef.
  /// This is the number of bytes that writeAsBinary() will write.
  ArrayRef<uint8_t>::size_type binary_size() const {
    if (DataIsHexString)
      return Data.size() / 2;
    return Data.size();
  }
  bool operator==(const BinaryRef &Ref) {
    // Special case for default constructed BinaryRef.
    if (Ref.Data.empty() && Data.empty())
      return true;

    return Ref.DataIsHexString == DataIsHexString && Ref.Data == Data;
  }
  /// \brief Write the contents (regardless of whether it is binary or a
  /// hex string) as binary to the given raw_ostream.
  void writeAsBinary(raw_ostream &OS) const;
};

}
}

namespace yaml {
template <> struct ScalarTraits<object::yaml::BinaryRef> {
  static void output(const object::yaml::BinaryRef &, void *,
                     llvm::raw_ostream &);
  static StringRef input(StringRef, void *, object::yaml::BinaryRef &);
};
}

}

#endif
