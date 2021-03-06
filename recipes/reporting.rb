# Reporting Server

include_recipe "crond::default"

env = node.chef_environment.downcase
env = 'production' if env == 'prod'

cron_d "mailchimp" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute '30'
  hour '1'
  command "cd /var/www/reporting;RAILS_ENV=#{env} bundle exec rake export:mailchimp:run"
end

cron_d "data_transfer_check" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute "0"
  command "cd /var/www/reporting;RAILS_ENV=#{env} bundle exec rake data_transfer:check"
end

cron_d "daily_denormalizer_job" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute "0"
  hour "1"
  command "cd /var/www/reporting;RAILS_ENV=#{env} bundle exec rake db:denormalizer:daily"
end
