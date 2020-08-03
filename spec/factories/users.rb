FactoryBot.define do
  
  factory :user do
    nickname             {"nickname"}
    email                 {"test@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"名前"}
    last_name             {"苗字"}
    first_kana            {"ナマエ"}
    last_kana             {"ミョウジ"}
    date                  {Time.zone.now}
  end
end