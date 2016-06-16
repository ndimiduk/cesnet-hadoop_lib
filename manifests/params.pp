# == Class hadoop_lib::params
#
# This class sets variables according to platform.
#
class hadoop_lib::params {
  case "${::osfamily}-${::operatingsystem}" {
    /Debian|RedHat/: {
      $mapred_home = '/usr/hdp/current/hadoop-mapreduce-client'
    }
    default: {
      fail("${::osfamily}/${::operatingsystem} not supported")
    }
  }
}
