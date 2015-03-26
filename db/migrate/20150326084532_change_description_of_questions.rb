class ChangeDescriptionOfQuestions < ActiveRecord::Migration
  def up
    change_column :questions, :countnum, :interger, default: 0
  end

  def down
    change_column :questions, :countnum, :interger, default: nil
  end
end
