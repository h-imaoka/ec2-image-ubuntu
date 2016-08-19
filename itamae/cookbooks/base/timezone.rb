execute "timedatectl set-timezone #{node.timezone}" do
  action :run
  user   "root"
  not_if "timedatectl | grep #{node.timezone}"
end
