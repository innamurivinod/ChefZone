#
# Cookbook:: final
# Recipe:: install_tomcat
#   This recipe installs tomcat based out of the documentation from
#   https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-ubuntu-14-04-via-apt-get
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'update_packages' do
  action :update
end

appserver_package = node['final']['applicationserver']['package_name']

package appserver_package do
  action :install
end

additional_packages = node['final']['applicationserver']['additional_packages']

#additional_packages.each do |pack|
#  package pack do
#    action :install
#  end
#end

package additional_packages do
  action :install
end

service appserver_package do
  action :restart
end

template '/etc/tomcat7/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
  owner 'root'
  mode '0755'
  notifies :restart, "service[#{appserver_package}]"
  action :create
end
