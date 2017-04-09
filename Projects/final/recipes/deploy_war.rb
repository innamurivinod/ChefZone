#
# Cookbook:: .
# Recipe:: deploy_war
# This recipe deploy the openmrs.war to from the 
# remote location https://downloads.sourceforge.net/project/openmrs/releases/OpenMRS_Platform_2.0.1/openmrs.war
# Copyright:: 2017, The Authors, All Rights Reserved.

appserver_package = node['final']['applicationserver']['package_name']

remote_file '/var/lib/tomcat7/webapps/openmrs.war' do
  source 'https://downloads.sourceforge.net/project/openmrs/releases/OpenMRS_Platform_2.0.1/openmrs.war'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{appserver_package}]"
  action :create
end

