directory "/opt/misc/bin" do
  action :create
  user   "root"
  group  "root"
  owner  "root"
  mode   "755"
end

remote_file "/opt/misc/bin/set-rpsrfs" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0755"
  source :auto
end

remote_file "/etc/systemd/system/set-rpsrfs.service" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end

service "set-rpsrfs" do
  action :enable
  user   "root"
end
