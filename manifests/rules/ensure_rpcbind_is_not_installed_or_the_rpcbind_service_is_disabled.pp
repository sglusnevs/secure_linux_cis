# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_rpcbind_is_not_installed_or_the_rpcbind_service_is_disabled {
  package { 'rpcbind':
    ensure => absent,
  }
}