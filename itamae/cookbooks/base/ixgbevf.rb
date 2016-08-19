execute "download ixgbevf" do
  action :run
  user   "root"
  cwd    "/usr/src"
  not_if "modinfo ixgbevf | grep #{node.ixgbevf.version}"

  command <<-EOS
    curl -L -o ixgbevf-#{node.ixgbevf.version}.tar.gz http://downloads.sourceforge.net/project/e1000/ixgbevf%20stable/#{node.ixgbevf.version}/ixgbevf-#{node.ixgbevf.version}.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fe1000%2Ffiles%2Fixgbevf%2520stable%2F#{node.ixgbevf.version}%2F&ts=#{Time.now.to_i}
    sleep 3
  EOS

  notifies :run, "execute[extract ixgbevf]"
end

execute "extract ixgbevf" do
  action :nothing
  user   "root"
  cwd    "/usr/src"

  command <<-EOS
    tar -xzvf ixgbevf-#{node.ixgbevf.version}.tar.gz
  EOS

  notifies :create, "template[/usr/src/ixgbevf-#{node.ixgbevf.version}/dkms.conf]"
end

template "/usr/src/ixgbevf-#{node.ixgbevf.version}/dkms.conf" do
  action :nothing
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source "templates/usr/src/ixgbevf/dkms.conf.erb"

  variables version: node.ixgbevf.version

  notifies :run, "execute[install ixgbevf]"
end

execute "install ixgbevf" do
  action :nothing
  user   "root"

  command <<-EOS
    dkms add -m ixgbevf -v #{node.ixgbevf.version}
    dkms build -m ixgbevf -v #{node.ixgbevf.version}
    dkms install -m ixgbevf -v #{node.ixgbevf.version}
    update-initramfs -c -k all
  EOS
end
