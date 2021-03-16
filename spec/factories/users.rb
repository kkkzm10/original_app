FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'sato'}
    first_name            {'taro'}
    self_introduction     {'Hello. How are you?'}
    image                {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/human6.jpeg'), 'public/images/human6.jpeg')}
  end                    
end