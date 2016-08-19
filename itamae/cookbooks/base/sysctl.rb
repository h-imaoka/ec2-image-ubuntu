file "/etc/sysctl.d/90-tunings.conf" do
  action   :create
  user     "root"
  owner    "root"
  group    "root"
  mode     "0644"
  content  node.sysctl.parameters.map {|k, v| "#{k} = #{v}\n"}.join
  notifies :start, "service[procps]"
end

service "procps" do
  action :nothing
  user   "root"
end
