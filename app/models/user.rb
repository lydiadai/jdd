# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  is_vip                 :boolean          default(FALSE)
#  role                   :integer
#

class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    has_many :orders
    enum role: { user: 0, vip: 1, admin: 2 }
    after_initialize :set_default_role, if: :new_record?
    def set_default_role
        self.role ||= :user
    end

    def admin?
        self.role == 'admin'
        is_admin == true
    end

    def is_user?
        self.role = 'user'
    end

    def vip?
        self.role = 'vip'
        is_vip == true
    end

    def qunlified_vip?
        role == 'vip' && is_vip
    end

    def unqunlified_vip?
        role == 'vip' && !is_vip
    end

    def qunlified_admin?
        role == 'admin' && is_admin
    end

    def unqunlified_admin?
        role == 'admin' && !is_admin
    end

    def approve!
        self.is_admin = true
        save
    end

    def cancel!
        self.role = 'user'
        self.is_admin = false
        save
    end

    def approv!
        self.is_vip = true
        save
        # update_column(:is_vip, true)
        #  save
    end

    def cance!
        self.role = 'user'
        self.is_vip = false
        save
    end
end
