package "chrony" do
  action  :install
  user    "root"
end

template "/etc/chrony/chrony.conf" do
  action   :create
  user     "root"
  owner    "root"
  group    "root"
  mode     "0644"
  source   :auto
  notifies :restart, "service[chrony]"

  variables(
    pools: node.chrony.pools,
  )
end

service "chrony" do
  action :enable
  user   "root"
end
