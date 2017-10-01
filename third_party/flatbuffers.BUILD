# Copyright 2017 Renato Utsch
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # Apache 2.0

cc_library(
    name = "flatbuffers",
    hdrs = [
        "include/flatbuffers/code_generators.h",
        "include/flatbuffers/base.h",
        "include/flatbuffers/flatbuffers.h",
        "include/flatbuffers/hash.h",
        "include/flatbuffers/idl.h",
        "include/flatbuffers/util.h",
        "include/flatbuffers/reflection.h",
        "include/flatbuffers/reflection_generated.h",
        "include/flatbuffers/flexbuffers.h",
        "include/flatbuffers/registry.h",
    ],
    srcs = [
        "src/code_generators.cpp",
        "src/idl_parser.cpp",
        "src/idl_gen_text.cpp",
        "src/reflection.cpp",
        "src/util.cpp",
    ],
    includes = ["include"],
)

py_library(
    name = "py_flatbuffers",
    srcs = glob(["python/**/*.py"]),
)

cc_binary(
    name = "flatc",
    srcs = [
        "src/idl_gen_cpp.cpp",
        "src/idl_gen_general.cpp",
        "src/idl_gen_go.cpp",
        "src/idl_gen_js.cpp",
        "src/idl_gen_php.cpp",
        "src/idl_gen_python.cpp",
        "src/idl_gen_fbs.cpp",
        "src/idl_gen_grpc.cpp",
        "src/flatc.cpp",
        "src/flatc_main.cpp",
        "grpc/src/compiler/schema_interface.h",
        "grpc/src/compiler/cpp_generator.h",
        "grpc/src/compiler/cpp_generator.cc",
        "grpc/src/compiler/go_generator.h",
        "grpc/src/compiler/go_generator.cc",
        "grpc/src/compiler/config.h",
    ],
    includes = ["grpc"],
    deps = [
        ":flatbuffers",
    ],
)

cc_binary(
    name = "flathash",
    srcs = [
        "include/flatbuffers/hash.h",
        "src/flathash.cpp",
    ],
    includes = ["include"],
)
