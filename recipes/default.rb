#
# Cookbook Name:: phpdev
# Recipe:: default
#
# Copyright 2014, Yuya Takeyama
#
# All rights reserved - Do Not Redistribute
#
%w{php5 php5-mysql php5-cli php-pear}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
 
execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end
