FactoryBot.define do
  factory :post, class: Post do
    title { 'good' }
    place { '杏林大学病院' }
    impression { '丁寧な対応でした' }
    created_at { 20.minutes.ago }
  end

  factory :most_recent, class: Post do
    title { 'most resent' }
    place { '最近大学病院' }
    impression { '最近です' }
    user { association :user, email: 'recent@example.com' }
  end
end

def user_with_posts(posts_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:post, posts_count, user: user)
  end
end
