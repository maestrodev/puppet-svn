define svn::config::credentials($realmstring, $username, $password, $mode = "0600") {
  file { "${svn::homedir}/.subversion/auth/svn.simple":
    owner   => "${svn::user}",
    group   => "${svn::group}",
    mode    => $mode,
    ensure  => directory,
  }
  file { "${svn::homedir}/.subversion/auth/svn.simple/$name":
    owner   => "${svn::user}",
    group   => "${svn::group}",
    mode    => $mode,
    content => template("svn/simpleauth.erb")
  }
}