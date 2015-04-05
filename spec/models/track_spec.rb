require 'rails_helper'

RSpec.describe Track, :type => :model do


    context "test track output" do

      before do
        @metting = Metting.new()
      end

      subject(:track) { Track.new(@metting) }

      it "print meeting track" do
        p track.output
        expect(track)
      end

    end

end
