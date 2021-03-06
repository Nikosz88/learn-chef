#
# Cookbook:: mydatabase
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'update'

package 'postgresql'

service 'postgresql' do
  action [:start, :enable]
end

execute 'createdb roux_artists' do
  user 'postgres'
  not_if 'psql --dbname=roux_artists'
end