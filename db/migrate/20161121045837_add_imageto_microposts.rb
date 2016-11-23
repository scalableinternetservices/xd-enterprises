class AddImagetoMicroposts < ActiveRecord::Migration
  def self.up
    add_attachment :microposts, :image
  end

  def self.down
    add_attachment :microposts, :image
  end
end
