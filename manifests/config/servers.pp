define svn::config::servers( $plaintext_passwords = false ) {
  if $plaintext_passwords {
    file { "${svn::homedir}/.subversion/servers":
      owner  => "${svn::user}",
      group  => "${svn::group}",
      mode   => "0600",
      source => "puppet:///svn/servers",
    }
  }
}
