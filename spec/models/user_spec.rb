

describe User do
	describe User do
	  before { @user = User.new(name: "simon", email: "user@example.com", password: "password", password_confirmation: "password" ) }
	  
	  subject { @user }
	  
	  it { should respond_to(:username) }
	  it { should respond_to(:emaail) }
    
end
