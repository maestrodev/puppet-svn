define svn::config::servers( $plaintext_passwords = false ) {
  if $plaintext_passwords {
    file { "${svn::config::homedir}/.subversion/servers":
      owner  => "${svn::config::user}",
      group  => "${svn::config::group}",
      mode   => "0600",
      source => "puppet:///svn/servers",
    }
  }
}
