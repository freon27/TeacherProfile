require 'bundler/capistrano'
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :application, "teacherprofile" # EDIT THIS TO MATCH YOUR APP NAME
set :deploy_to, "/var/www/#{application}"

set :user, "rt140admin@rails-trial-140.1steasy.net" # EDIT THIS TO MATCH YOUR SITE ADMIN NAME
set :use_sudo, false
ssh_options[:forward_agent] = true # USE THIS IF YOU ARE USING SSH KEYS

role :app, "rails-trial-140.1steasy.net" # EDIT THIS TO MATCH YOUR DOMAIN
role :web, "rails-trial-140.1steasy.net" # EDIT THIS TO MATCH YOUR DOMAIN
role :db,  "rails-trial-140.1steasy.net", :primary => true # EDIT THIS TO MATCH YOUR DOMAIN


default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:freon27/TeacherProfile.git"  # Your clone URL

desc "Create symlinks for chrooted environment"
task :chrooted_symlinks do
    run "rm /var/www/passenger"
    run "cd /var/www && ln -s #{application}/releases/#{release_path.split('/').last} passenger"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last} && rm log && ln -s ../../shared/log"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last}/public && rm system && ln -s ../../../shared/system"
    run "cd /var/www/#{application}/releases/#{release_path.split('/').last}/tmp && rm pids && ln -s ../../../shared/pids"
end

namespace :deploy do
  task :start, :roles => :app do
  end

  task :stop, :roles => :app do
  end

  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :after_symlink, :roles => [:app, :web] do
    chrooted_symlinks
  end

end