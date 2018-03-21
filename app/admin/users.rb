ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


##設定在rails4裡所需要的Strong Parameter

permit_params :email, :password, :password_confirmation, :role
##設定user後台的畫面會有哪些欄位資料

  index do
      column :email
      column :current_sign_in_at
      column :last_sign_in_at
      column :sign_in_count
      column :role
      #actions是會在每筆資料後面加上view,edit,delete的編輯選項

      actions
  end
  #畫面右邊會出現filter功能，後面的欄位就是看你要用什麼欄位當作條件。

  filter :email
  #這個form就是用來修改用的如果沒有用特定的block包起來的話這個form就是通用在edit,new這兩個action

  form do |f|
      f.inputs "User Details"  do
          f.input :email
          f.input :password
          f.input :password_confirmation
          f.input :role, as: :radio, collection: {None: "none", Administrator: "admin"}
      end

      f.actions
  end

end
