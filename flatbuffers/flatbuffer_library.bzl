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

FlatBufferInfo = provider()

def get_transitive_srcs(srcs, deps):
    transitive_srcs = depset()
    for dep in deps:
        transitive_srcs += dep[FlatBufferInfo].srcs
    transitive_srcs += srcs
    return transitive_srcs

def _flatbuffer_library_impl(ctx):
    return [FlatBufferInfo(srcs = get_transitive_srcs(ctx.files.srcs,
                                                       ctx.attr.deps))]

flatbuffer_library = rule(
    attrs = {
        "deps": attr.label_list(providers = [FlatBufferInfo]),
        "srcs": attr.label_list(allow_files = True),
    },
    implementation = _flatbuffer_library_impl,
)

"""
Rule to specify flatbuffer schema files.

WIP.

Attrs:
    deps: other flatbuffer_library rules to depend on.
    srcs: flatbuffer schema sources provided by this rule.
"""
