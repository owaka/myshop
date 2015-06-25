require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  test "product price must be positive integer" do
    product = Product.new(title: "test",
                          description: "yyy",
                          image_url: "zzz.jpg")
  product.price = -1
  assert product.invalid?
  assert_equal "は0より大きい値にしてください。", product.errors[:price].join('; ')
  product.price = 0
  assert product.invalid?
  assert_equal "は0より大きい値にしてください。", product.errors[:price].join('; ')
  product.price = 0.1
  assert product.invalid?
  assert_equal "は整数で入力してください。", product.errors[:price].join('; ')
  #product.price = 1
  #assert product.valid?

  product1 = Product.new(title: "MyString",
                        description: "yyy",
                        image_url: "zzz.jpg")
  assert product1.invalid?
  assert_equal "はすでに存在します。",product1.errors[:title].join('; ')
  end
end
