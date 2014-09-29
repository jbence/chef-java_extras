#
# Cookbook Name:: java_extras
# Recipe:: jce_policy
#
# Copyright 2013, CultureJam, Inc.
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

source_dir  = "/tmp"
policy_dir  = "#{source_dir}/UnlimitedJCEPolicy"
jdk_version = node['java']['jdk_version']
java_home   = node['java']['java_home']

if jdk_version.to_i != 7
  Chef::Log.error("Only Java JDK 7 is supported by the JCE Policy recipe")
end

bash "extract-jce-policy" do
  cwd source_dir
  code <<-EOH
    set -e

    # This unzip creates the directory named in policy_dir variable
    unzip jce-policy-#{jdk_version}.zip

    cd "#{java_home}/jre/lib/security"
    if ! [ -e "local_policy.jar.bak" ]; then
      cp local_policy.jar local_policy.jar.bak
    fi
    if ! [ -e "US_export_policy.jar.bak" ]; then
      cp US_export_policy.jar US_export_policy.jar.bak
    fi
    cp "#{policy_dir}/local_policy.jar" "#{policy_dir}/US_export_policy.jar" .
  EOH
  action :nothing
end

remote_file "#{source_dir}/jce-policy-#{jdk_version}.zip" do
  source   node['java']['jce_policy'][jdk_version]['url']
  checksum node['java']['jce_policy'][jdk_version]['checksum']
  notifies :run, "bash[extract-jce-policy]", :immediately
end
