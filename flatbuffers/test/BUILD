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

load("//flatbuffers:defs.bzl", "cc_flatbuffer_library")

package(default_visibility = ["//visibility:private"])

cc_flatbuffer_library(
    name = "monster_cc_flatbuffer",
    srcs = ["monster.fbs"],
)

cc_binary(
    name = "game",
    srcs = ["game.cpp"],
    deps = [":monster_cc_flatbuffer"],
)
