class ShippingCharges < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '着払い' },
    { id: 3, name: '送料込み' }

  ]
end
