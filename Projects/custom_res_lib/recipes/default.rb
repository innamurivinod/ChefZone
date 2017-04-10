#
# Cookbook:: resources_demo
# Recipe:: default
# This is merely for creating a library and a custom resource motd merely for testing.
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'update_packages' do
  action :update
end

package_name = node['webserver']['package']

package package_name do
  action :install
end

service package_name do
  action [:start, :enable]
end

homepage_path = node['webserver']['homepage']['path']

cookbook_file homepage_path do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{package_name}]"
  action :create
  only_if { Homepage.exists? }
end

motd 'messageOfTheDay' do
  action :delete
end

#motd 'messageOfTheDay' do
#  action :create
#  message 'This is managed by Bethala\'s Family'
#end