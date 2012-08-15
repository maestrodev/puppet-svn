class svn(
  $version = installed,
  $user,
  $homedir="/home/$user",
  $group=$user
) {
  package { subversion:
    ensure => $version,
  }
  
  file { "$homedir/.subversion":
    owner   => $user,
    group   => $group,
    mode    => "0700",
    ensure  => directory,
    require => User[$user],
  } ->
  file { "$homedir/.subversion/auth":
    owner   => $user,
    group   => $group,
    mode    => "0700",
    ensure  => directory,
  }
}

