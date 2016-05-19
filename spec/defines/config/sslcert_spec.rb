require 'spec_helper'

describe 'svn::config::sslcert' do
  uuid = 'd3c8a345b14f6a1b42251aef8027ab57'
  user = 'user'

  let(:pre_condition) { %Q[
    class { 'svn::config':
      user => '#{user}',
    }
  ] }
  let(:title) { uuid }
  let(:params) {{
    :realmstring => '<https://svn.example.com:443> Committers',
    :value => 'my_cert_value',
  }}
  it "should create the ssl cert cache" do
    file = "/home/user/.subversion/auth/svn.ssl.server/#{uuid}"
    should contain_file(file).with_owner(user)
      .with_content(%r[V 40])
      .with_content(%r[<https://svn.example.com:443> Committers])
      .with_content(%r[V 13])
      .with_content(%r[my_cert_value])
  end
end
