FactoryBot.define do
  factory :item do
  
    goods_name      {"名前"}
    content         {"説明"}
    category_id        {2}
    condition_id       {2}
    delivery_price_id  {2}
    prefecture_id      {2}
    delivery_date_id   {2}
    price           {2000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/dog.jpeg'), filename: 'dog.jpeg')
    end
  end
end
