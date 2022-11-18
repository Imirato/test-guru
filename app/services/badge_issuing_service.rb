class BadgeIssuingService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test.category
  end

  def call
    Badge.all.each do |badge|
      send(badge.rule, badge)
    end
  end

  private

  def first_successful_attempt(badge)
    return if @test.title != badge.object_title

    give_badge(badge) if @user.test_passages.where(test: @test).count == 1 && @test_passage.success?
  end

  def all_tests_by_category(badge)
    return if badge.object_title != @category.title

    all_successful_tests = Test.joins(:test_passages).where(category: @category,
                                                            test_passages: { success: true, user: @user }).distinct

    give_badge(badge) if all_successful_tests.count == @category.tests.count
  end

  def give_badge(badge)
    @user.badges << badge
  end
end
