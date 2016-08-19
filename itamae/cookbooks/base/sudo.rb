remote_file "/etc/sudoers" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0440"
  source :auto
end
