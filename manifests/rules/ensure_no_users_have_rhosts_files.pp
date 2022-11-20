# @api private
# 4 Ensure no users have .rhosts files (Scored)
#
# Description:
# While no .rhosts files are shipped by default, users can easily create them.
#
# @summary 4 Ensure no users have .rhosts files (Scored)
#
class secure_linux_cis::rules::ensure_no_users_have_rhosts_files {
  file { '/usr/share/cis_scripts/rhost.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/rhost.sh'),
  }
  unless $facts['rhost_files'].empty {
    notify { 'rf':
      message  => 'Not in compliance with CIS 4 (Scored). A user(s) has .rhost files in their home directory. Check the rhost_files fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
