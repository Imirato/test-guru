module TestPassagesHelper
  def timer(closing_time)
    tag.div(id: 'passage_time',
            class: 'row justify-content-center border rounded-pill mb-4',
            data: { closing_time: })
  end
end
