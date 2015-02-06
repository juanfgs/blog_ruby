
ActiveAdmin.register Profile  do
  actions :all, except: [:new,:destroy]
  permit_params :summary, :facebook, :twitter
  scope_to do
    current_admin_user().profile
  end




  
end
