crumb :root do
  link "トップページ", root_path
end

crumb :items do |item|
  if params[:item_id] == nil
    item = Item.find(params[:id])
  else
    item = Item.find(params[:item_id])
  end
  link "商品詳細", item_path(item.id)
  parent :root
end

crumb :items_edit do
  item = Item.find(params[:id])
  link "商品編集", edit_item_path(item.id)
  parent :items
end

crumb :purchases do |item|
  item = Item.find(params[:item_id])
  link "商品購入", item_purchases_path(item.id)
  parent :items
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).