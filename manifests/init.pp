#
# Install subversion client
#
class svn(
  $version = installed,
) {
  package { 'subversion':
    ensure => $version,
  }
}

