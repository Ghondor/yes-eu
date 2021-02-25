module Dashboard
  class LevelsController < Dashboard::DashboardController
    # load_and_authorize_resource
    before_action :set_level, only: %i[show edit update destroy]

    def index
      @levels = Level.all
    end

    def show; end

    def new
      @level = Level.new
    end

    def edit; end

    def create
      @level = Level.new(level_params)
      @exam = Exam.new(teacher_id: current_user.id)
      school_id = current_user.school.id

      if @exam.can_create_exam?(school_id)
        @exam.school_id = school_id
        @exam.teacher_id = current_user.id
        @exam.save

        if @level.can_create_level?(school_id, @exam.id)
          @level.exam = @exam
          @level.teacher_id = current_user.id if current_user.teacher_role? || current_user.superadmin_role?

          if @level.save
            redirect_to dashboard_level_url(@level), notice: 'Level was successfully created.'
          else
            render :new, status: :unprocessable_entity
          end
        else
          render :new, status: :unprocessable_entity
        end
      else
        render :new, alert: 'You have created 9 exams already!'
      end
    end

    def update
      if @level.update(level_params)
        redirect_to @level, notice: 'Level was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @level.destroy

      redirect_to dashboard_levels_path, notice: 'Level was successfully destroyed.'
    end

    private

    def set_level
      @level = Level.find(params[:id])
    end

    def level_params
      params.require(:level).permit(questions_attributes: %i[id question_title first_answer second_answer third_answer
                                                                     correct_answer _destroy])
    end
  end
end
