RSpec.describe Activity do
  describe "associations" do
    specify { should belong_to(:user) }
    specify { should belong_to(:channel) }
  end
end
