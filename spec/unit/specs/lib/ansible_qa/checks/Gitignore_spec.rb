require "spec_helper"

class AnsibleQA
  class Check
    class Gitignore

      context "When gitignore lacks mandatory entries" do

        let(:gitignore) do
          AnsibleQA::Check::Base.root(Pathname.new("spec/unit/fixtures/ansible-role-invalid"))
          AnsibleQA::Check::Base.tmp(Pathname.new("spec/unit/fixtures/ansible-role-latest"))
          Gitignore.new
        end

        it "responds to check" do
          expect(gitignore.respond_to?("check")).to eq(true)
        end

        it "runs checks and warns" do
          expect(gitignore).to receive(:warn).with(/the following items should be ignored:/)
          gitignore.check
        end

      end

      context "When gitignore is identical" do

        let(:gitignore) do
          AnsibleQA::Check::Base.root(Pathname.new("spec/unit/fixtures/ansible-role-latest"))
          AnsibleQA::Check::Base.tmp(Pathname.new("spec/unit/fixtures/ansible-role-latest"))
          Gitignore.new
        end

        it "runs checks and does not warn" do
          expect(gitignore).not_to receive(:warn)
          gitignore.check
        end

      end

    end
  end
end