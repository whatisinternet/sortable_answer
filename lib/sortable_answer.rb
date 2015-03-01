require "sortable_answer/version"
require 'json'

module SortableAnswer
  class Answer
    attr_accessor :products, :listings, :matches

    def initialize(product_file, listing_file)
      self.products = File.readlines(product_file)
      self.listings = File.readlines(listing_file)
      self.matches = []
    end

    def hashify(json)
      json.map { |j| JSON.parse(j) }
    end

    def make_regex(str)
      Regexp.new("#{str}", Regexp::IGNORECASE)
    end

    def make_match(product_hash, challenge_hash)
       make_regex(product_hash["manufacturer"]).match(challenge_hash["title"])
    end

    def model_match(product_hash, challenge_hash)
       make_regex(product_hash["model"]).match(challenge_hash["title"])
    end

    def eqal_product(product_hash, challenge_hash)
      product_hash["product_name"].downcase.tr('_', ' ') == challenge_hash["title"].downcase
    end

    def product_matcher(product_hash, challenge_hash)
      if make_match(product_hash, challenge_hash) && 
          model_match(product_hash, challenge_hash)
        return challenge_hash
      elsif eqal_product(product_hash, challenge_hash)
        return challenge_hash
      end

    end

    def find_product_match(product, listings)
        products_and_listings = {product_name: product["product_name"], listings: []}
        products_and_listings[:listings] = listings.map do |listing|
          match = product_matcher(product, listing)
          match unless match.nil?
        end
        products_and_listings
    end

    def find_all_matches
      products = hashify(self.products)
      listings = hashify(self.listings)
      self.matches = products.map do |product|
        find_product_match(product, listings)
      end
    end

    def jsonfiy
      out_str = ""
      self.matches.each do |match|
        out_str += "#{match.to_json}\n"
      end
      out_str
    end

  end

end
