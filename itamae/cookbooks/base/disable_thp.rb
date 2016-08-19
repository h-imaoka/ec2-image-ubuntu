directory "/opt/misc/bin" do
  action :create
  user   "root"
  group  "root"
  owner  "root"
  mode   "755"
end

remote_file "/opt/misc/bin/disable-thp" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0755"
  source :auto
end

remote_file "/etc/systemd/system/disable-thp.service" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end

service "disable-thp" do
  action :enable
  user   "root"
end
