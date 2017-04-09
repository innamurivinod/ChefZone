#
# Cookbook:: .
# Recipe:: db_server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'update_package' do
  action :update
end

#mysql client configuration
mysql_client 'default' do
  action :create
end

dbgitem = data_bag_item('admin', 'mysql_root_password', IO.read("/etc/chef/encrypted_data_bag_secret"))

#mysql server configuration
mysql_service 'default' do
  version '5.5'
  bind_address '0.0.0.0'
  port '3306'
  initial_root_password dbgitem['passwd']
  action [:create, :start]
end