# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_iptables_services_not_installed_with_firewalld {
  package { 'firewalld':
    ensure => absent,
  }
}