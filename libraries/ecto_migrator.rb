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

module Ecto
  module Migrator
    class << self
      def bin_path(node)
        File.join(node[:ecto][:migrator][:install_path], "migrator")
      end

      def deploy_path(node)
        File.join("/opt/ecto-migrator", node[:ecto][:migrator][:release])
      end
    end
  end
end
