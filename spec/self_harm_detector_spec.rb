# frozen_string_literal: true

RSpec.describe SelfHarmDetector do
  it "has a version number" do
    expect(SelfHarmDetector::VERSION).not_to be nil
  end

  context "detects lack of self harm intent" do
    it "detects lack of self harm intent" do 
      expect(SelfHarmDetector.detect(text: "I really love myself today")).to be 0
    end
    it "detects lack of self harm intent when a sentence is similar" do 
      expect(SelfHarmDetector.detect(text: "I don't want to hurt myself")).to be 0
    end
  end
  
  context "detects self harm intent" do
    it "detects self harm intent" do 
      expect(SelfHarmDetector.detect(text: "I want to hurt myself")).to be 1
    end
    it "detects self harm intent with a score of 2 for two matches" do 
      expect(SelfHarmDetector.detect(text: "I want to hurt myself because I hate myself")).to be 2
    end
    it "detects self harm intent even if punctuation changes" do 
      expect(SelfHarmDetector.detect(text: "I want to hurt myself!")).to be 1
    end
    
  end
end
