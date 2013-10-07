# Reporting Server

include_recipe "crond::default"

cron_d "mailchimp" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute '30'
  hour '1'
  command "cd /var/www/reporting;RAILS_ENV=#{env} bundle exec rake export:mailchimp:run"
end
