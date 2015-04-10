class User < ActiveRecord::Base
  validates :username, presence: true,
                       length: { 
    minimum: 5,
    maximum: 20,
    wrong_length: "The user name should be 5~20 characters long. Please try again." 
  }
  
  validates :password, presence: true,
                       length: { 
    minimum: 8,
    maximum: 20,
    wrong_length: "The password should be 8~20 characters long. Please try again."
  }
end
