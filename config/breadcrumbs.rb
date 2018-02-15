crumb :root do
    link "Home", root_path
end

crumb :school_details do
  link "教室について", school_details_path
end

crumb :study do
  link "学習内容", study_path
end

crumb :price do
  link "料金", price_path
end

crumb :search do
  link "教室を探す", search_path
end

crumb :classworks do
  link "教室検索一覧", classworks_path
  parent :search
end

crumb :classwork do |classwork|
  link "#{classwork.classwork_city}教室", classwork
  parent :classworks
end

crumb :applicants_top do
  link "教室開設希望の方", applicants_path
end

crumb :applicants_flow do
  link "教室開講までの流れ", applicants_flow_path
end

crumb :applicants_support do
  link "安心サポートについて", applicants_support_path
end

crumb :sign_in do
  link "教室を始める", new_user_registration_path
end

crumb :log_in do
  link "ログイン", new_user_session_path
end

# crumb :user do |user|
#   link "#{user.last_name}#{user.first_name}さんのページ", user_path
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