# Configuration of .subversion and auth
class svn::config(
  $user,
  $homedir="/home/${user}",
  $group=$user
) {

  file { "${homedir}/.subversion":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0700',
    require => User[$user],
  } ->
  file { "${homedir}/.subversion/auth":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0700',
  }
}
