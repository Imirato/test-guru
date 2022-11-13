class BadgeIssuingService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|

    end
  end

  private

  def issuing_badges_by_first_attempt

  end
end
