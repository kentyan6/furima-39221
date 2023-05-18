require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  describe '購入情報の保存' do
    before do
      order = FactoryBot.create(:order)
      @order_information = FactoryBot.build(:order_information, order_id: order.id)
    end

context '内容に問題ない場合' do
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_information).to be_valid
  end
  it 'building_nameは空でも保存できること' do
    @order_information.building_name = ''
    expect(@order_information).to be_valid
  end
end

context '内容に問題がある場合' do
  it 'postal_codeが空だと保存できないこと' do
    @order_information.postal_code = ''
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @order_information.postal_code = '1234567'
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end
  it 'prefectureを選択していないと保存できないこと' do
    @order_information.prefecture_id = 0
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'cityが空だと保存できないこと' do
    @order_information.city = nil
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("City can't be blank")
  end
  it 'house_numberが空だと保存できないこと' do
    @order_information.house_number = nil
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("House number can't be blank")
  end
  it 'telephone_numberが空だと保存できないこと' do
    @order_information.telephone_number = nil
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("Telephone number can't be blank")
  end
  it 'telephone_numberに全角数字が入っていると保存できないこと' do
    @order_information.telephone_number = '０９０36661111'
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include('Telephone number is invalid')
  end
  it 'telephone_numberに記号が入っていると保存できないこと' do
    @order_information.telephone_number = '090-1111-1111'
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include('Telephone number is invalid')
  end
  it 'userが紐付いていないと保存できないこと' do
    @order_information.user_id = nil
    @order_information.valid?
    expect(@order_information.errors.full_messages).to include("User can't be blank")
  end
end
end
end
