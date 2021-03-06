include_recipe "attributes/default.rb"

include_recipe "cookbooks/base/apt_packages.rb"
include_recipe "cookbooks/base/timezone.rb"
include_recipe "cookbooks/base/ixgbevf.rb"
include_recipe "cookbooks/base/sysctl.rb"
include_recipe "cookbooks/base/rpsrfs.rb"
include_recipe "cookbooks/base/disable_thp.rb"
include_recipe "cookbooks/base/limits.rb"
include_recipe "cookbooks/base/logrotate.rb"
include_recipe "cookbooks/base/chrony.rb"
include_recipe "cookbooks/base/ec2_env.rb"
include_recipe "cookbooks/base/login_info.rb"
include_recipe "cookbooks/base/awslogs.rb"
include_recipe "cookbooks/base/ssm.rb"
include_recipe "cookbooks/base/prompt.rb"
include_recipe "cookbooks/base/sudo.rb"
