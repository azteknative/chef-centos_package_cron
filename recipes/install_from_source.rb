
%w[ mailx
    git
    python-setuptools
    python-sqlalchemy
    yum-plugin-changelog ].each do |p|

  package p
end

directory node['centos_package_cron']['data_dir'] do
  action :create
end

git '/usr/local/src/centos-package-cron' do
  repository node['centos_package_cron']['repo_url']
  action :sync
end

bash 'install-centos-package-cron' do
  cwd '/usr/local/src/centos-package-cron'
  code 'python ./setup.py install'
end

