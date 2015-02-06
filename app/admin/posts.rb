ActiveAdmin.register Post do
  permit_params :title, :content, :image
  scope_to :current_admin_user


  form :html => { :enctype => "multipart/form-data" }  do |f|
    inputs 'Post', :multipart => true  do
      input :title
      input :content
      f.input :image, hint: f.post.image? ? image_tag(f.post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG image")

    end
    

    para "Press cancel to return to the list without saving."
    actions

  end

  
end
