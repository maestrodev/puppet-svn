require 'spec_helper'

DEFAULT_USER='user'

describe 'svn' do
  context "default parameters" do
    let(:params) {{
        :user => DEFAULT_USER,
    }}
    it { should contain_package('subversion').with_ensure('installed') }
    
    it { should contain_file("/home/#{DEFAULT_USER}/.subversion/auth").with_owner(DEFAULT_USER)}
  end

  context "with package version" do
    let(:params) {{
        :user => DEFAULT_USER,
        :version => '1.7.0'
    }}
    it { should contain_package('subversion').with_ensure('1.7.0') }
  end
  
  context "with custom home directory" do
    let(:params) {{
        :user => DEFAULT_USER,
        :homedir => '/var/lib/service'
    }}
    it { should contain_file("/var/lib/service/.subversion/auth").with_owner(DEFAULT_USER)}
  end
end
