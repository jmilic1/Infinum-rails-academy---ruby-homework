# Local gift shop needs a custom solution for packaging their products. Their assortment
# includes different items like mugs, t-shirts, gift cards, etc. In order to ship the order, all
# products are packaged in boxes. Since shipping company charges by weight of the package, your task
# is to come up with a solution that will calculate the total weight of all items in a
# package(including boxes used for packaging).
#
# Example:
#  +box---------------------+     Whole package consists of two boxes
#  |                        |       - small box which holds the mug
#  |+box---+                |       - large box which holds a box with mug, gift cards and tshirts
#  ||      |                |
#  ||1x mug|   2x gift card |
#  |+------+   3x tshirt    |     Total weight:
#  +------------------------+           item   | weight | quantity | total weight
#                                   -----------+--------+----------+-------------
#                                       mug    |  200g  |    1     |     200g
#                                    small box |  100g  |    1     |     100g
#                                    gift card |   20g  |    2     |      40g
#                                     tshirt   |   50g  |    3     |     150g
#                                    large box |  200g  |    1     |     200g
#                                   -----------+--------+----------+-------------
#                                                                  |     690g
#
# Create a base class Item which holds generic information about weight and quantity. Item
# constructor accepts hash of options, and then extracts weight from `:weight` and quantity fom
# `:quantity` key. If quantity is not specified, default to 1. Public interface consists of just
# one method `#total_weight`.
#
# Usage example:
#   Item.new(weight: 100, quantity: 3)

# Create a Box class which inherits from Item. In a constructor, extract a list of
# items from `:items` key, and pass options to Item constructor(overridden method in the
# parent class is called with `super`). Override and implement `#total_weight` method.
#
# Usage example:
#   Box.new(
#     weight: 50,
#     items: [Item.new(weight: 50, quantity: 2), Item.new(weight: 100, quantity: 3)]
#  )

class Item
end

class Box
end
