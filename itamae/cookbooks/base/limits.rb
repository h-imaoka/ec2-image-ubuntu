remote_file "/etc/security/limits.d/nproc-nofile.conf" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end
