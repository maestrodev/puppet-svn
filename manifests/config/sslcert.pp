define svn::config::sslcert($realmstring, $value) {
  file { "${svn::config::homedir}/.subversion/auth/svn.ssl.server":
    owner   => "${svn::config::user}",
    group   => "${svn::config::group}",
    mode    => "0700",
    ensure  => directory,
  } ->
  file { "${svn::config::homedir}/.subversion/auth/svn.ssl.server/$name":
    owner   => "${svn::config::user}",
    group   => "${svn::config::group}",
    mode    => "0600",
    content => template("svn/sslserver.erb")
  }
}
