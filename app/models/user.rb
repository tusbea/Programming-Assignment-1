class User < ActiveRecord::Base
  validates :username, length: { 
    minimum: 5,
    maximum: 20,
    too_long: "The user name should be 5~20 characters long. Please try again.", 
    too_short: "The user name should be 5~20 characters long. Please try again." 
  }
  
  validates :password, length: { 
    minimum: 8,
    maximum: 20,
    too_long: "The password should be 8~20 characters long. Please try again.",
    too_short: "The password should be 8~20 characters long. Please try again."
  }
end
