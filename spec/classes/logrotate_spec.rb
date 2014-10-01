require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'logrotate' do
  let(:title) { 'logrotate' }
  let(:node)  { 'logrotate' }

  rpm_distros = [ 'RedHat', 'CentOS', 'Scientific', 'OEL', 'Fedora' ]
  deb_distros = [ 'Debian', 'Ubuntu' ]
  all_distros = rpm_distros | deb_distros

  all_distros.each do |os|
    describe "#{os}, w/o parameters" do
      let(:facts) {
        {
          :operatingsystem => os,
          :kernel          => 'Linux'
        }
      }

      it do
        $pkg     = 'logrotate'
        $confdir = '/etc/logrotate.d'

        should create_class('logrotate')
        should contain_class('logrotate::install')
        should contain_class('logrotate::config')

        should contain_file($confdir).with_ensure('directory')
        should contain_package($pkg).with_ensure('present')
      end
    end
  end
end

