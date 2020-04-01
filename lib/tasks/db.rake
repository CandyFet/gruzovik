namespace :db do

  desc "Dumps the database to log/APP_NAME.dump"
  task dump: :environment do
    cmd = nil
    with_config do |app, host, db, user, password|
      cmd = "mysqldump#{" -h#{host}" if host} -u#{user} -p#{password} #{db} > #{Rails.root}/log/#{app}.sql"
    end
    puts cmd
    exec cmd
  end

  desc "Restores the database dump at log/APP_NAME.dump."
  task restore: :environment do
    cmd = nil
    with_config do |app, host, db, user|
      cmd = "mysql#{" -h#{host}" if host} -u#{user} -p#{password} #{db} < #{Rails.root}/log/#{app}.sql"
    end
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    puts cmd
    exec cmd
  end

  private

  def with_config
    yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
  end

end