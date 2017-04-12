require 'rails_helper'

describe GenresService do

  describe "::select_options" do
    it "returns a simple hash of available genre options" do
      expect(described_class.select_options).to eq({"Classical" => "Classical", "Pop" => "Pop"})
    end
  end
end
