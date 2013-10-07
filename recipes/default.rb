#
# Cookbook Name:: cron
# Recipe:: default
# Author:; Brian Scott <bscott@optimiscorp.com>
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "cron"

env = node.chef_environment.downcase
env = 'production' if env == 'prod'
