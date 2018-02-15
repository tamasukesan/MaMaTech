module DeviseHelper

  # def devise_error_messages!
  #   return "" if resource.errors.empty?
  #   html = ""
  #   # エラーメッセージ用のHTMLを生成
  #   messages = resource.errors.full_messages.each do |msg|
  #     html += <<-EOF
  #       <div class="error_field alert alert-danger" role="alert">
  #         <p class="error_msg">#{msg}</p>
  #       </div>
  #     EOF
  #   end
  #   html.html_safe
  # end

  # def error_messages!(r,col,name)
  #   if r.errors.empty?
  #     return ""
  #   else
  #     arr = resource.errors.messages[col]
  #     return "#{name}" + arr[0]
  #   end
  # end

  #   def error_messages!(r,col,name)
  #   if r.errors.empty?
  #     return ""
  #   else
  #       html = ""
  #     r.errors.messages[col].each do |arr|
  #       # エラーメッセージ用のHTMLを生成
  #       # msg = "#{name}" + arr[0]
  #       html += <<-EOF
  #         <div class="error_field alert alert-danger" role="alert">
  #           <p class="error_msg">#{name}#{arr}</p>
  #         </div>
  #       EOF
  #     end
  #   end
  #   html.html_safe
  # end

end