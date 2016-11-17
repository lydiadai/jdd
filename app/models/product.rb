# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_hidden   :boolean          default(TRUE)
#

class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    def publish!
        self.is_hidden = false
        save
    end

    def hide!
        self.is_hidden = true
        save
    end
end
