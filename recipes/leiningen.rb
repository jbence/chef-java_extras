#
# Cookbook Name:: chef-java_extras
# Recipe:: leiningen
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

lein_install_path = "#{node['leiningen']['lein_install_dir']}/lein"
lein_version = node['leiningen']['version']

remote_file lein_install_path do
  source "https://raw.github.com/technomancy/leiningen/#{lein_version}/bin/lein"
  owner "root"
  group "root"
  mode 0755
  not_if "grep -qx 'export LEIN_VERSION=\"#{lein_version}\"' #{lein_install_path}"
end
