require_relative '../../spec_helper'

describe "ENV.clear" do
  it "deletes all environment variables" do
    orig = ENV.to_hash
    env_object_id = ENV.object_id
    begin
      ENV.clear.object_id.should == env_object_id

      # This used 'env' the helper before. That shells out to 'env' which
      # itself sets up certain environment variables before it runs, because
      # the shell sets them up before it runs any command.
      #
      # Thusly, you can ONLY test this by asking through ENV itself.
      ENV.size.should == 0
    ensure
      ENV.replace orig
    end
  end

end
