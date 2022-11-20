# @api private
# 0 Ensure HTTP server is not enabled (Scored)
#
# Description:
# HTTP or web servers provide the ability to host web site content.
#
# Rationale:
# Unless there is a need to run the system as a web server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 0 Ensure HTTP server is not enabled (Scored)
#
class secure_linux_cis::rules::ensure_http_server_is_not_installed {
  package { 'httpd':
    ensure => absent,
  }
}
