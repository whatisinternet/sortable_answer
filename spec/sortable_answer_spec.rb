require 'spec_helper'
require 'fileutils'

describe SortableAnswer do

  products = "#{Dir.pwd}/spec/fixtures/product_test.txt"
  listings = "#{Dir.pwd}/spec/fixtures/listings_test.txt"

  before :each do
    @sortable = SortableAnswer::Answer.new(products, listings)
  end

  describe "initialize" do
    it "should assign products to an array" do
      expect(@sortable.products).to be_a(Array)
    end
    it "should assign listings to an array" do
      expect(@sortable.listings).to be_a(Array)
    end
  end

  describe "hashify" do
    it "should turn json into a hash" do
      expect(@sortable.hashify(@sortable.products)[0]).to be_a(Hash)
    end
  end

  describe "regexes" do

    describe "make_regex" do
      it "should return a regex" do
        expect(@sortable.make_regex("test")).to be_a(Regexp)
      end
    end

    describe "regex_model" do
      it "should match the model it's based off" do
        test_data = @sortable.hashify(@sortable.products)[0]
        expect(@sortable.make_regex(test_data["model"])
          .match(test_data["model"])).to be_truthy
      end
    end

    describe "regex_manufacturer" do
      it "should match the manufacturer it's based off" do
        test_data = @sortable.hashify(@sortable.products)[0]
        expect(@sortable.make_regex(test_data["manufacturer"])
          .match(test_data["manufacturer"])).to be_truthy
      end
    end

  end

  describe "model_match" do
    it "should match model" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_data = @sortable.hashify(@sortable.listings)[0]
      expect(@sortable.model_match(test_product, test_data)).to be_a(MatchData)
    end
  end

  describe "make_match" do
    it "should match make" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_data = @sortable.hashify(@sortable.listings)[0]
      expect(@sortable.model_match(test_product, test_data)).to be_a(MatchData)
    end
  end

  describe "equal_product" do
    it "should return a truthy value" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_data = @sortable.hashify(@sortable.listings)[0]
      expect(@sortable.eqal_product(test_product, test_data)).to_not be_nil
    end
  end

  describe "product_matcher" do
    it "should return an array of all matches" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_data = @sortable.hashify(@sortable.listings)[0]
      expect(@sortable.product_matcher(test_product, test_data)).to equal(test_data)
    end
    it "should return an array of all matches" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_product["model"] = "fake"
      test_product["product_name"] = "be_equal"
      test_data = @sortable.hashify(@sortable.listings)[0]
      test_data["title"] = "be equal"
      expect(@sortable.product_matcher(test_product, test_data)).to be_truthy
    end

  end

  describe "find_product_match" do
    it "should return a hash of a match" do
      test_product = @sortable.hashify(@sortable.products)[0]
      test_data = @sortable.hashify(@sortable.listings)
      test = @sortable.find_product_match(test_product, test_data)
      expect(test).to be_a(Hash)
      expect(test).to include(:product_name)
      expect(test).to include(:listings)
    end
  end

  describe "find_all_matches" do
    it "should return a hashmap of matches" do
      @sortable.find_all_matches
      expect(@sortable.matches[0]).to be_a(Hash)
    end
    it "should return a hash with key product" do
      @sortable.find_all_matches
      expect(@sortable.matches[0]).to include(:product_name)
    end
    it "should return a hash with key listings" do
      @sortable.find_all_matches
      expect(@sortable.matches[0]).to include(:listings)
    end
    it "should have listings being an array" do
      @sortable.find_all_matches
      expect(@sortable.matches[0][:listings]).to be_a(Array)
    end
  end

  describe "jsonify" do
    it "should return a string of json data" do
      @sortable.find_all_matches
      expect(@sortable.jsonfiy).to be_a(String)
    end
  end

end
