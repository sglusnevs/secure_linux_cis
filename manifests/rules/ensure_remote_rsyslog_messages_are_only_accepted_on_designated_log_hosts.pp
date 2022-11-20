# @api private
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
class secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts {
  Class['secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts']
  ~> Class['secure_linux_cis::reboot']
  if $secure_linux_cis::logging == 'rsyslog' {
    if $secure_linux_cis::is_logging_host {
      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$ModLoad imtcp',
        match  => '\$ModLoad',
      }
      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
      }
    }
    else {
      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$ModLoad imtcp',
        match  => '\$ModLoad',
      }
      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
      }
    }
  }
}
