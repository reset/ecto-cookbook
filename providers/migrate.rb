#
# Cookbook Name:: ecto
# Provider:: migrate
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

use_inline_resources

action :run do
  execute "#{new_resource.name}-ecto-migrate" do
    command "migrator up #{new_resource.migrations_path} #{new_resource.connection_string} -s #{new_resource.schema}"
    environment new_resource.environment
  end
end
