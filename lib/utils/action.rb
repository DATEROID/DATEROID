module Utils
  class Action
    def initialize(user, action_name)
      @user = user
      @name = action_name
    end

    def execute
      case @name
      when "initial_question"
      	initial_question
      when "find_matching"
      	find_matching
      when "adjust_schedule"
      	adjust_schedule
      when "recieve_feedback"
      	recieve_feedback
      else
      end
    end

    private
      def initial_question
      end

      def find_matching
      end

      def adjust_schedule
      end

      def recieve_feedback
      end
  end
end