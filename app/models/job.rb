class Job < ApplicationRecord
    validates :title, presence: true
    validates :wage_lower_bound, presence: true
    validates :wage_upper_bound, presence: true
    validates :wage_lower_bound, numericality: { greater_than: 0 }
    scope :recent, -> { order('created_at DESC') }
    scope :publish, -> { where(is_hidden: false) }
    def publish!
        self.is_hidden = false
        save
    end

    def hide!
        self.is_hidden = true
        save
    end

    has_many :resumes
end
