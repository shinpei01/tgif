class RenameMicropostsToQuestions < ActiveRecord::Migration
  def change
    rename_table :microposts, :questions #この行を追加！
  end
end
