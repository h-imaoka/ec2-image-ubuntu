remote_file "/tmp/awslogs-setup.conf" do
  action   :create
  user     "root"
  owner    "root"
  group    "root"
  mode     "0644"
  source   :auto
  only_if  "systemctl status awslogs | grep not-found"
  notifies :run, "execute[install awslogs]"
end

execute "install awslogs" do
  action :nothing
  user   "root"

  command <<-EOS
    curl -s https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -o /tmp/awslogs-agent-setup.py
    sleep 2
    python /tmp/awslogs-agent-setup.py --region=#{node.ec2["placement"]["availability-zone"].chop} --non-interactive --configfile=/tmp/awslogs-setup.conf
    rm -f /tmp/awslogs-agent-setup.py /tmp/awslogs-setup.conf
    systemctl enable awslogs
  EOS
end
