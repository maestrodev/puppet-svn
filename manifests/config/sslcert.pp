define svn::config::sslcert($realmstring, $value) {
  file { "${svn::homedir}/.subversion/auth/svn.ssl.server":
    owner   => "${svn::user}",
    group   => "${svn::group}",
    mode    => "0700",
    ensure  => directory,
  } ->
  file { "${svn::homedir}/.subversion/auth/svn.ssl.server/$name":
    owner   => "${svn::user}",
    group   => "${svn::group}",
    mode    => "0600",
    content => template("svn/sslserver.erb")
  }
}
