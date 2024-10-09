class Post < ApplicationRecord
    has_one_attached :image  # ActiveStorageの画像を1つ添付できるようにする
end
