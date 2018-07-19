class AddCachedVotesToPosts < ActiveRecord::Migration[5.1]
  def change
    change_table :microposts do |t|
      t.integer :cached_votes_total, default: 0
    end

    # Uncomment this line to force caching of existing votes
    # Micropost.find_each(&:update_cached_votes)
  end
end