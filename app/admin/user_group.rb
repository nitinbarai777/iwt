ActiveAdmin.register UserGroup do
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

  permit_params :name,
                user_user_groups_attributes: [:id, :user_id, :_destroy]

  filter :id
  filter :name

    # Index page definition
  index pagination_total: false do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  show do
    tabs do
      tab "Details" do
        attributes_table_for user_group do
          row :id
          row :name
        end
      end

      tab "Users" do
        table_for user_group.users do
          column :id do |user|
            link_to user.id, admin_user_path(user.id)
          end
          column :first_name do |user|
            user.first_name
          end
          column :last_name do |user|
            user.last_name
          end
          column :email do |user|
            user.email
          end
          column :manager_id do |user|
            user.manager_id
          end
        end
      end
    end
  end

  form multipart: true do |f|
    tabs do
      f.semantic_errors *f.object.errors.keys
      tab "Details" do
        f.inputs "Details" do
          f.input :name, required: true
        end
      end
    end
    f.actions
  end

end
