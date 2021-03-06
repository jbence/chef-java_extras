#
# Cookbook Name:: java_extras
#
# Copyright 2014, Medidata Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['java']['jce_policy']['7']['url'] = 'https://s3.amazonaws.com/medidata-installs/unlimited_jce_policy-7.zip'
default['java']['jce_policy']['7']['checksum'] = '7a8d790e7bd9c2f82a83baddfae765797a4a56ea603c9150c87b7cdb7800194d'
default['leiningen']['version'] = '2.4.0'
default['leiningen']['lein_install_dir'] = '/usr/local/bin'
