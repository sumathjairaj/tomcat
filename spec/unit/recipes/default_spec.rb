#
# Cookbook:: tomcat
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'tomcat::default' do
  describe command('curl http://localhost:8080') do
    its(:stdout) {should match /Tomcat/ }
  end

  describe package('java-1.7.0-openjdk-devel') do
    it { should be_installed }
  end

  describe group('tomcat') do
    it { should exist }
  end

  describe user('tomcat') do
    it { should exist }
    it { should belong_to_group 'tomcat' }
    it { should have_home_directory '/opt/tomcat' }
    it { should have_login_shell '/opt/tomcat' }
    it { should_not have_home_directory }
  end
end
