module Dashboard
  class ResultsController < Dashboard::DashboardController
    def index
      # @results = Exam.joins(:results).where(results: {student_id: current_user.i})
      @results = Result.where(student_id: current_user.id)
    end

    def new
      @result = Result.new
      @exam = Exam.find_by(id: params[:exam], school_id: current_user.school_id)
      @questions = @exam.level.questions
    end

    def create
      @result = Result.new(result_params)
      @result.student = current_user
      @result.taken = true

      if @result.save
        redirect_to dashboard_results_url, notice: 'Exam was successfully submitted.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def result_params
      params.require(:result).permit(%i[grade exam_id])
    end
  end
end
