# @api private
#  Ensure authentication required for single user mode (Scored)
#
# Description:
# ingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary  Ensure authentication required for single user mode (Scored)
#
class secure_linux_cis::rules::ensure_authentication_required_when_booting_into_rescue_mode {
  $os = "${facts['os']['name']}${facts['os']['release']['major']}"
  case $os {
    'Debian8', 'Debian9', 'Debian10', 'Ubuntu18.04': {
      unless $facts['rootpw`'].empty {
        notify { 'rootpw':
          message  => 'Not in compliance with CIS 1.4.3 (Scored). No authentication required for single user mode.',#lint:ignore:140chars
          loglevel => 'warning',
        }
      }
    }
    'RedHat8','CentOS8': {
      file_line { 'rescue':
        path  => '/usr/lib/systemd/system/rescue.service',
        line  => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue',
        match => '^ExecStart=',
      }

      file_line { 'emergency':
        path  => '/usr/lib/systemd/system/emergency.service',
        line  => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency',
        match => '^ExecStart=',
      }
    }
    default: {
      file_line { 'rescue':
        path  => '/usr/lib/systemd/system/rescue.service',
        line  => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
        match => '^ExecStart=',
      }

      file_line { 'emergency':
        path  => '/usr/lib/systemd/system/emergency.service',
        line  => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
        match => '^ExecStart=',
      }
    }
  }
}