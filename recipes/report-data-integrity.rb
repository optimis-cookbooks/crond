# PT3

include_recipe "crond::default"

env = node.chef_environment.downcase
env = 'production' if env == 'prod'

cron_d "mq_sync_data" do
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute "15"
  hour "1"
  command "cd /var/www/optimis;RAILS_ENV=#{env} bundle exec rake data_integrity:mq_sync_data auto_update=true from_date=$(date -dyesterday +\\%m/\\%d/\\%Y) > /var/www/optimis/log/reporting_mq_sync_data_$(date -dyesterday +\\%m\\%d\\%Y).log 2>&1"
end
