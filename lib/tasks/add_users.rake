namespace :add_user do
  task :add_one_user, [:name, :email, :password] => :environment do
    user = User.new(name: name, email: email, password_digest: password)
    user.save
  end
end
