include_recipe "cron::default"

cron "mailchimp" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute '30'
  hour '1'
  command "cd /var/www/reporting;RAILS_ENV=#{node[:reportingpt][:railsenv]} bundle exec rake export:mailchimp:run"
end
