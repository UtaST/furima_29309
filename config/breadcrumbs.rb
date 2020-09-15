crumb :root do
  link "Home", root_path
end

crumb :users_show do
  link "マイページ", users_show_path(current_user)
  parent :root
end

crumb :new_user_registration do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :new_user_session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_item do
  link "商品出品", new_item_path
  parent :root
end

crumb :new_card do
  link "クレジットカード情報登録", new_card_path
  parent :root
end

crumb :search_option_items do
  link "検索結果", search_option_items_path
  parent :root
end

crumb :item do
  link Item.find(params[:id]).name, item_path(params[:id])
  parent :root
end

crumb :edit_item do
  link "商品情報編集", edit_item_path(params[:id])
  parent :item
end
