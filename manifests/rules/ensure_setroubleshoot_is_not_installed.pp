# @api private
#  Ensure SETroubleshoot is not installed (Scored)
#
# Description:
# The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides
# important information around configuration errors, unauthorized intrusions, and other potential errors.
#
# @summary  Ensure SETroubleshoot is not installed (Scored)
#
class secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed {
  case $facts['os']['family'] {
    'Suse': {
      package { 'setroubleshoot':
        ensure   => absent,
      }
    }
    default: {
      package { 'setroubleshoot':
        ensure   => absent,
      }
    }
  }
}
