#
# Cookbook:: final
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'final::install_tomcat'
include_recipe 'final::deploy_war'
