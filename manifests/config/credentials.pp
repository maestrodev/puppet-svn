define svn::config::credentials($realmstring, $username, $password, $mode = "0600") {
  file { "${svn::config::homedir}/.subversion/auth/svn.simple":
    owner   => "${svn::config::user}",
    group   => "${svn::config::group}",
    mode    => $mode,
    ensure  => directory,
  }
  file { "${svn::config::homedir}/.subversion/auth/svn.simple/$name":
    owner   => "${svn::config::user}",
    group   => "${svn::config::group}",
    mode    => $mode,
    content => template("svn/simpleauth.erb")
  }
}