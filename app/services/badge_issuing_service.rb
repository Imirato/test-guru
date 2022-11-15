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
    if @user.test_passages.where(test: @test).count == 1 && @test_passage.successful_passage? &&
      @test.title == badge.object_title
      @user.badges << badge
    end
  end

  def all_tests_by_category(badge)
    if badge.object_title == @category.title
      all_successful_test_passages = 0
      @category.tests.each do |test|
        user_test_passages = test.test_passages.where(user_id: @user)
        user_test_passages.each do |test_passage|
          if test_passage.successful_passage?
            all_successful_test_passages += 1
            break
          end
        end
      end
    end
    if all_successful_test_passages == @category.tests.count
      @user.badges << badge
    end
  end
end
