include_recipe 'crond::default'

cron 'visit_metrics' do
  user 'devel'
  path '/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH'
  minute '01'
  command 'cd /var/www/optimis; RAILS_ENV=production bundle exec rake stats:visit_metrics'
end
