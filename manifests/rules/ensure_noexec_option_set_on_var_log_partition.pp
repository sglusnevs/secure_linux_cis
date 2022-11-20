# @api private
# 0 Ensure noexec option set on /var/log partition (Scored)
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 0 Ensure noexec option set on /var/log partition (Scored)
#
class secure_linux_cis::rules::ensure_noexec_option_set_on_var_log_partition {
  if $facts['mountpoints']['/var/log'] {
    augeas { '/etc/fstab - noexec on /var/log':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/log']/opt[last()]",
        "set *[file = '/var/log']/opt[last()] noexec",
      ],
      onlyif  => "match *[file = '/var/log']/opt[. = 'noexec'] size == 0",
    }
  }
}
