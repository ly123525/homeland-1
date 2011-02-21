# coding: utf-8  
# 记事本
class Note  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :body
  field :word_count, :type => Integer
  field :changes_count, :type =>  Integer, :default => 0
  belongs_to :user

  attr_protected :user_id, :changes_count, :word_count  

  default_scope :order => "id desc"

  before_save :auto_set_value
  def auto_set_value
    if !self.body.blank?
      self.title = self.body.split("\n").first[0..50]
      self.word_count = self.body.length
    end
  end

  before_update :update_changes_count
  def update_changes_count    
    self.changes_count = 0 if self.changes_count.blank?
    self.inc(:changes_count,1)
  end
  
  def self.cached_count
    return Rails.cache.fetch("notes/count",:expires_in => 1.hours) do
      self.count
    end
  end
end
