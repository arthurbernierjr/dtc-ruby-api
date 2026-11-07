class Todo < ApplicationRecord
  validates :subject, :details, presence: true

  def as_json(options = {})
    super(options.merge(only: %i[id subject details]))
  end
end
