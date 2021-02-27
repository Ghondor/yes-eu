module Dashboard
  class ExamsController < Dashboard::DashboardController
    before_action :set_exam, only: %i[show edit update destroy]

    def index
      @exams = current_user.school.exams.includes(%i[teacher])
    end

    def show
      @levels = @exam.levels
    end

    def new
      @exam = Exam.new
    end

    def edit; end

    def create
      @exam = Exam.new(exam_params)
      @exam.school_id = current_user.school.id
      @exam.teacher_id = current_user.id

      if @exam.can_create_exam?(@exam.school_id)
        if @exam.save
          redirect_to dashboard_exams_path, notice: 'Level was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      else
        render dashboard_exams_path, alert: 'You have created 9 exams already!'
      end
    end

    def update
      if @exam.update(exam_params)
        redirect_to dashboard_exams_path, notice: "Exam was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @exam.destroy

      redirect_to dashboard_exams_path, notice: 'Exam was successfully destroyed.'
    end

    private

    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      params.require(:exam).permit(:title)
    end
  end
end
