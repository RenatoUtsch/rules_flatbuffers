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

def flatbuffers_repositories(omit_flatbuffers=False):
    """Imports dependencies for rules_flatbuffers."""
    if not omit_flatbuffers:
        flatbuffers()

def flatbuffers():
  native.new_http_archive(
      name = "flatbuffers",
      build_file = str(Label("//third_party:flatbuffers.BUILD")),
      sha256 = "0f8dcdcfbbaba034756f97e4f9946a3784399b578f1b60c8deee3c85fafa3089",
      strip_prefix = "flatbuffers-1.7.1",
      urls = ["https://github.com/google/flatbuffers/archive/v1.7.1.tar.gz"],
  )
