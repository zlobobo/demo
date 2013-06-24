class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :timetables
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :admin, :timetable, :id
  # attr_accessible :title, :body

  after_destroy :ensure_an_admin_remains
  after_update :ensure_an_admin_remains

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :name, :length => { :maximum => 30 }
  validates :name, :presence => true

private

  def ensure_an_admin_remains
    if User.where('admin = ?',true).count.zero?
      raise "Can't remove last administrator"
    end
  end

end
