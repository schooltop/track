require 'rails_helper'

RSpec.describe Metting, :type => :model do

    describe "test metting" do

      subject(:metting) { Metting.new() }


      context "#when initialized" do
        
        it { should respond_to(:match_time) }
        it { should respond_to(:time_array) }
        it { should respond_to(:sum_time) }
        it { should respond_to(:time_style) }
        it { should respond_to(:sum_time) }
        
        it "create time_in_* methods" do
          metting.time_style.each do |_|
           expect(metting.send("time_in_#{_}"))
          end
        end

      end

      context "#test bingding time methodes" do

        it "test methode bingding_45 : use for bingding tow 45min metting and a 30min metting into a tow hour metting Package" do
          expect(metting.bingding_45)
        end

      end

      context "#test am_output" do

        it "test methode am_output" do
          expect(metting.am_output)
        end

      end

      context "#test pm_output" do

        it "test methode pm_output" do
          expect(metting.pm_output)
        end

      end


   end


end
