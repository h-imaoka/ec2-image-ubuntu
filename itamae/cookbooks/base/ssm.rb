execute "install amazon-ssm-agent" do
  action :run
  user   "root"
  not_if "dpkg -l | grep amazon-ssm-agent"

  command <<-EOS
    curl https://amazon-ssm-#{node.ec2["placement"]["availability-zone"].chop}.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb -o amazon-ssm-agent.deb
    dpkg -i amazon-ssm-agent.deb
    rm -f amazon-ssm-agent.deb
  EOS
end

remote_file "/etc/systemd/system/amazon-ssm-agent.service" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end

service "amazon-ssm-agent" do
  action :enable
  user   "root"
end
