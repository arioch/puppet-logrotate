require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'logrotate::file' do
  let(:title) { 'logrotate' }
  let(:node)  { 'logrotate' }

  rpm_distros = [ 'RedHat', 'CentOS', 'Scientific', 'OEL', 'Fedora' ]
  deb_distros = [ 'Debian', 'Ubuntu' ]
  all_distros = rpm_distros | deb_distros

  all_distros.each do |os|
    describe "logrotate::file" do
      let(:facts) { {:operatingsystem => os, :kernel => 'Linux'} }

      let(:title) { '_entry_' }
      let(:params) {
        {
          :log        => [ '_log1_', '_log2_' ],
          :options    => [ '_options1_', '_options2_' ],
          :prerotate  => 'NONE',
          :postrotate => 'NONE'
        }
      }

      it do
        should create_logrotate__file('_entry_')
      end
    end
  end
end

