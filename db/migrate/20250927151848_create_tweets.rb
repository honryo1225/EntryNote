class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.string :kigyoumei
      t.datetime :start_time
      t.text :mypage_url

      t.timestamps
    end
  end
end
