define svn::config::credentials(
  $realmstring, 
  $username, 
  $password, 
  $owner = $svn::config::user,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
  $mode = "0600",
) {
  file { "$homedir/.subversion/auth/svn.simple":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    ensure  => directory,
  }
  file { "$homedir/.subversion/auth/svn.simple/$name":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template("svn/simpleauth.erb")
  }
}
