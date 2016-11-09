class AnsibleQA
  class Check
    class Ackrc < AnsibleQA::Check::Base

      def initialize
        super('.ackrc')
      end

      def check
        must_exist
        should_be_identical
      end

    end
  end
end