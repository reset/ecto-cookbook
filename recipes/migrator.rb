#
# Cookbook Name:: ecto
# Recipe:: migrator
#
# Copyright (C) 2014-2015 Jamie Winsor
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
#

include_recipe "elixir::default"
include_recipe "libarchive::default"

asset = github_asset "migrator.tar.gz" do
  repo node[:ecto][:migrator][:repo]
  release node[:ecto][:migrator][:release]
end

libarchive_file "migrator.tar.gz" do
  path asset.asset_path
  extract_to Ecto::Migrator.deploy_path(node)

  action :extract
  only_if { ::File.exist?(asset.asset_path) }
end

link Ecto::Migrator.bin_path(node) do
  to File.join(Ecto::Migrator.deploy_path(node), "migrator")
end
