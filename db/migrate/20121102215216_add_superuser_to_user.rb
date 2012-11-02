class AddSuperuserToUser < ActiveRecord::Migration
  def up
    add_column :users, :superuser, :boolean,
                                    :null => false, 
                                    :default => false
    begin
      User.find_by_email('mikey7047@gmail.com').update_attribute(:superuser, true)
    rescue
      # We don't care if this doesn't work
    end
  end

  def down
    remove_column :users, :superuser
  end
end
