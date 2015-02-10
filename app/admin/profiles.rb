ActiveAdmin.register User  do
  actions :all, except: [:new,:destroy]
  permit_params :name,:password, :email,:summary, :facebook,:twitter

  
  form do |f|
     f.semantic_errors
     f.inputs "User" do
       input :name
       input :password
       input :email      
       input :summary
       input :facebook
       input :twitter
     end
    f.actions
  end

  index do
    selectable_column
    column :name
    actions
  end

  show do

    panel "User Information" do
      attributes_table_for user do
        row :name
        row :email
      end
    end
    
    panel "User's summary" do
      attributes_table_for user do 
        row :summary
        row :twitter
        row :facebook
      end
    end    
    
    panel "Author's posts" do
      table_for user.posts do
        column :title
        column :created_at
      end
    end




    
  end


  
end
