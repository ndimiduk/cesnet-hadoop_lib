# == Resource hadoop::common::postinstall
#
# Noop because HDP doesn't support alternatives for conf dir
#
define hadoop_lib::postinstall(
  $alternatives = '::default',
) {
  $path = '/sbin:/usr/sbin:/bin:/usr/bin'

  $default_alternatives = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => undef,
    # https://github.com/puppet-community/puppet-alternatives/issues/18
    /RedHat/        => '',
    /Debian/        => 'cluster',
    default         => 'cluster',
  }
  $confdir = "${::osfamily}-${::operatingsystem}" ? {
    /RedHat-Fedora/ => "/etc/${name}",
    /Debian|RedHat/ => "/etc/${name}/conf",
    default         => "/etc/${name}/conf",
  }

  if $alternatives == '::default' {
    $confname = $default_alternatives
  } else {
    $confname = $alternatives
  }
}
