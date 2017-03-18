require 'robot'
RSpec.describe Robot do

  # => L - Turn left
  # => R - Turn right
  # => F - Go forward
  describe "#report" do
    before(:each) { 
      Robot.class_variable_set(:@@ABORT, false) 
    }

    context "validate momvemnt" do
      context "facing north" do
        context "turn left" do
          it "should turn left and facing west" do
            robot = Robot.new(["10","10"], ["1","1","N"], "L")
            expect(robot.report).to eq("Report: 1 1 W")
          end
          context "turn around 180 degrees" do
            it "should turn around 180 degrees and facing south" do
              robot = Robot.new(["10","10"], ["1","1","N"], "LL")
              expect(robot.report).to eq("Report: 1 1 S")
            end
          end
          context "turn around 180 degrees and go ouside the matrix" do
            it "should turn around 180 degrees and go ouside the matrix" do
              robot = Robot.new(["10","10"], ["1","1","N"], "LLFFFF")
              expect(robot.report).to eq("Ouside the matrix - X:10 Y:10")
            end
          end
          context "turn around 360 degrees" do
            it "should turn around 360 degrees and facing north" do
              robot = Robot.new(["10","10"], ["1","1","N"], "LLLL")
              expect(robot.report).to eq("Report: 1 1 N")
            end
          end
        end

        context "turn right" do
          it "should turn right and facing west" do
            robot = Robot.new(["10","10"], ["1","1","N"], "R")
            expect(robot.report).to eq("Report: 1 1 E")
          end
          context "turn around 180 degrees" do
            it "should turn around 180 degrees and facing south" do
              robot = Robot.new(["10","10"], ["1","1","N"], "RR")
              expect(robot.report).to eq("Report: 1 1 S")
            end
          end

          context "turn around 180 degrees and go ouside the matrix" do
            it "should turn around 180 degrees and go ouside the matrix" do
              robot = Robot.new(["10","10"], ["1","1","N"], "RRFFF")
              expect(robot.report).to eq("Ouside the matrix - X:10 Y:10")
            end
          end

          context "turn around 360 degrees" do
            it "should turn around 360 degrees and facing north" do
              robot = Robot.new(["10","10"], ["1","1","N"], "RRRR")
              expect(robot.report).to eq("Report: 1 1 N")
            end
          end
        end

        context "momvemnt" do
          it "should move one step forward" do
            robot = Robot.new(["10","10"], ["1","1","N"], "F")
            expect(robot.report).to eq("Report: 1 2 N")
          end

          it "should move five steps forward" do
            robot = Robot.new(["10","10"], ["1","1","N"], "FFFFF")
            expect(robot.report).to eq("Report: 1 6 N")
          end

          it "should move LFFRFRFRFF" do
            robot = Robot.new(["5","5"], ["1","2","N"], "LFFRFRFRFF")
            expect(robot.report).to eq("Report: 0 1 S")
          end
        end
      end

      context "facing west" do
        context "turn left" do
          it "should turn left and facing south" do
            robot = Robot.new(["10","10"], ["1","1","W"], "L")
            expect(robot.report).to eq("Report: 1 1 S")
          end
        end
        context "turn around 180 degrees and go ouside the matrix" do
          it "should turn around 180 degrees and facing south" do
            robot = Robot.new(["10","10"], ["1","1","W"], "FFFF")
            expect(robot.report).to eq("Ouside the matrix - X:10 Y:10")
          end
        end
        context "turn right" do
          it "should turn right and facing west" do
            robot = Robot.new(["10","10"], ["1","1","W"], "R")
            expect(robot.report).to eq("Report: 1 1 N")
          end
        end
      end

      context "facing east" do
        context "turn left" do
          it "should turn left and facing north" do
            robot = Robot.new(["10","10"], ["1","1","E"], "L")
            expect(robot.report).to eq("Report: 1 1 N")
          end
        end
        context "turn right" do
          it "should turn right and facing south" do
            robot = Robot.new(["10","10"], ["1","1","E"], "R")
            expect(robot.report).to eq("Report: 1 1 S")
          end
        end
        context "momvemnt" do
          it "should move one step forward" do
            robot = Robot.new(["10","10"], ["1","1","E"], "F")
            expect(robot.report).to eq("Report: 2 1 E")
          end

          it "should move five steps forward" do
            robot = Robot.new(["10","10"], ["1","1","E"], "FFFFF")
            expect(robot.report).to eq("Report: 6 1 E")
          end

          it "should move RFLFFLRF" do
            robot = Robot.new(["5","5"], ["0","0","E"], "RFLFFLRF")
            expect(robot.report).to eq("Ouside the matrix - X:5 Y:5")
          end
        end
      end

      context "facing south" do
        it "should turn left and facing east" do
          robot = Robot.new(["10","10"], ["1","1","S"], "L")
          expect(robot.report).to eq("Report: 1 1 E")
        end
        context "turn right" do
          it "should turn right and facing south" do
            robot = Robot.new(["10","10"], ["1","1","S"], "R")
            expect(robot.report).to eq("Report: 1 1 W")
          end
        end
      end
    end
    context "invalid input momvemnt" do
      context "facing north" do
        context "go forward" do
          it "should move five steps forward" do
            robot = Robot.new(["10","10"], ["1","1","N"], "BWSAWDFFFAFF")
            expect(robot.report).to eq("Report: 1 6 N")
          end
          it "should move five steps forward" do
            robot = Robot.new(["10","10"], ["1","1","A"], "BWSAWDFFFAFF")
            expect(robot.report).to eq("Report: 1 6 N")
          end
          it "should stay" do
            robot = Robot.new(["10","10"], ["1","1","A"], "AAA")
            expect(robot.report).to eq("Report: 1 1 N")
          end
        end
      end
    end
  end
end