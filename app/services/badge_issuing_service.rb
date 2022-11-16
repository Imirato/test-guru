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
    return unless @test.title == badge.object_title

    give_badge(badge) if @user.test_passages.where(test: @test).count == 1 && @test_passage.successful_passage?
  end

  def all_tests_by_category(badge)
    return unless badge.object_title == @category.title

    all_successful_test_passages = TestPassage.where(user: @user, test: @category.tests)
                                              .find_all(&:successful_passage?).map(&:test).uniq
    give_badge(badge) if all_successful_test_passages == @category.tests.count
  end

  def give_badge(badge)
    @user.badges << badge
  end
end
