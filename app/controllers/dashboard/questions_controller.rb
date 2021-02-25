module Dashboard
  class QuestionsController < Dashboard::DashboardController
    before_action :set_question, only: %i[show edit update destroy]

    def index
      @questions = Question.all
    end

    def show; end

    def new
      @questions = Question.new
    end

    def edit; end

    def create
      @questions = Question.new(question_params)

      if @questions.save
        redirect_to @questions, notice: 'Question was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @questions.update(question_params)
        redirect_to @questions, notice: 'Question was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @questions.destroy

      redirect_to dashboard_questions_path, notice: 'Question was successfully destroyed.'
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name)
    end
  end
end
