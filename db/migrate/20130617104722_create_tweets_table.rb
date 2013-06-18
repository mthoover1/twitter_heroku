class CreateTweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string     :body
      t.string     :author
      t.datetime   :tweet_created

      t.timestamps
    end
  end
end
