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

def cc_flatbuffer_library(name, srcs, visibility = None):
    """
    Generates a cc_library from a flatbuffers schema file.

    For each file in srcs, a <src>_generated.h file will be generated.

    Params:
        name: name of the cc_library to be generated.
        srcs: flatbuffer schemas to use to generate the library.
    """
    outs = ["{}_generated.h".format(src[:src.rfind(".fbs")]) for src in srcs]

    native.genrule(
        name = "{}_gen".format(name),
        srcs = srcs,
        outs = outs,
        cmd = "$(location @flatbuffers//:flatc) -o $(@D) --cpp $(SRCS)",
        tools = ["@flatbuffers//:flatc"],
        visibility = visibility,
    )

    native.cc_library(
        name = name,
        hdrs = [":{}_gen".format(name)],
        deps = ["@flatbuffers"],
        includes = ["."],
        visibility = visibility,
    )
