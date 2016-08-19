node.apt.packages.each do |package_name|
  package package_name do
    user    "root"
    action  :install
  end
end
