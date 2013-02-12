define svn::config::sslcert(
  $realmstring, 
  $value,
  $owner = $svn::config::user,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
) {
  file { "$homedir/.subversion/auth/svn.ssl.server":
    owner   => $owner,
    group   => $group,
    mode    => "0700",
    ensure  => directory,
  } ->
  file { "$homedir/.subversion/auth/svn.ssl.server/$name":
    owner   => $owner,
    group   => $group,
    mode    => "0600",
    content => template("svn/sslserver.erb")
  }
}
