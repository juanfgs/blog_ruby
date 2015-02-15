ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Recent Posts" do
           ul do
             Post.take(5).map do |post|
               li link_to(post.title, admin_post_path(post))
             end
           end
         end
       end
       column do
         panel "Recent Comments" do
           Comment.take(5).map do |comment|
             li link_to(comment.name, admin_post_path(comment))
           end
         end
       end
     end
  end # content
end
