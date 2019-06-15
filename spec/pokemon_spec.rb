RSpec.describe Pokemon do
  it "has a version number" do
    expect(Pokemon::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
