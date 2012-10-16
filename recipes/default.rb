#
# Cookbook Name:: stunnel
# Recipe:: default
#
# Copyright 2012, freistil IT
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

package "stunnel4" do
  action :install
end

service "stunnel4" do
	supports :start => true, :stop => true, :reload => true, :restart => true
	action [:enable, :start]
end

template "/etc/stunnel/stunnel.conf" do
	source "stunnel.conf.erb"
	owner "root"
	group "root"
	mode 0644
	variables(
		:services => node['stunnel']['services']
	)
	notifies :reload, "service[stunnel4]"
end

unless node['stunnel']['certs'].empty? 
	node['stunnel']['certs'].each do |name, pem|

		file "/etc/stunnel/#{name}.pem" do
			content pem
			owner "root"
			group "root"
			mode 0600
			notifies :reload, "service[stunnel4]"
		end

	end
end
