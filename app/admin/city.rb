ActiveAdmin.register City do
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
  menu label: "BLOGS"
  permit_params :name, :blog_content

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
        attributes_table_for city do
          row :id
          row :name
        end
      end
      tab "Blog" do
        attributes_table_for city do
          row (:blog_content) { |city| raw(city.blog_content) }
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
      tab "Blog" do
        f.inputs "Blog" do
          f.input :blog_content, :as => :ckeditor
        end
      end
    end
    f.actions
  end

end
