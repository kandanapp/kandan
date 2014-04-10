class FixAuthenticationTokens < ActiveRecord::Migration
  def change
    User.all.each do |user|
      user.save!
    end
  end
end
