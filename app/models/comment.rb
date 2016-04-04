class Comment < ActiveRecord::Base
  # This is the person making the comment
  belongs_to :user
  # The owner of the barder is a_comment.barter.user
  belongs_to :barter

  # marked accepted, thus making all other comments for the barter at hand declined
  def set_accepted
    self.accept = true
    self.save
    self.barter.reload
    # select all comments under current barter
    comments = self.barter.comments
    comments.each do |comment|
      # if comment.accept is not true should be equal to false
      if comment.accept != true
        comment.accept = false
        comment.save
      end
    end
  end

  def set_declined
    self.accept = false
    self.save
  end
end
