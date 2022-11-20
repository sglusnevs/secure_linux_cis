# @api private
#  Ensure nosuid option set on /tmp partition (Scored)
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary  Ensure nosuid option set on /tmp partition (Scored)
#
class secure_linux_cis::rules::ensure_nosuid_option_set_on_tmp_partition {
  if $facts['mountpoints']['/tmp'] {
    augeas { '/etc/fstab - nosuid on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] nosuid",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'nosuid'] size == 0",
    }
  }
}
