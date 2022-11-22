# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_nfs_is_not_installed {
  package { 'nfs-kernel-server':
    ensure => absent,
  }
}