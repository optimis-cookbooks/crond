include_recipe "cron::default"

cron "RC WD Deploy" do
  user "devel"
  path "/usr/local/bin:/usr/bin:/bin:$PATH"
  minute "0/5"
  command "/usr/local/bin/wd --check deploy --path=/var/www/optimis/config/deploy.yml --to=optimis:rc"
end