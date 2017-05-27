#
# Cookbook:: weblogic_book
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java::oracle'
include_recipe 'weblogic_book::weblogic_install'
#include_recipe 'weblogic_book::weblogic_domain'