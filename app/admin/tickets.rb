ActiveAdmin.register Ticket do
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

index do
    column :name
    column :airline
    column :fiight_no
    column :quantity
    column :price, :sortable => :price do |ticket|
      div :class => "price" do
      end
    end
    default_actions
    #actions是會在每筆資料後面加上view,edit,delete的編輯選項

    #actions

    end







  filter :title



end
