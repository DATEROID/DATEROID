module Utils
  class Action
    def initialize(user, action_type)
      @user = user
      @type = action_type
    end

    def execute
      case @type
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