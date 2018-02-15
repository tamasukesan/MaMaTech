module ApplicationHelper

  # 電話番号の正規表現
  def format_phone(str)
    return str if str.blank?

    case str.size
    when 10
      str.gsub(/(\d{2})(\d{4})(\d{4})/, '\1-\2-\3')
    when 11
      str.gsub(/(\d{3})(\d{4})(\d{4})/, '\1-\2-\3')
    else
      str
    end
  end

  # 郵便番号の正規表現
  def format_post(str)
    return str if str.blank?

    case str.size
    when 7
      str.gsub(/(\d{3})(\d{4})/, '\1-\2')
    else
      str
    end
  end

  def error_messages!(r,col,name)
    if r.errors.empty?
      return ""
    else
        html = ""
      r.errors.messages[col].each do |arr|
        # エラーメッセージ用のHTMLを生成
        # msg = "#{name}" + arr[0]
        html += <<-EOF
          <div class="error_field alert alert-danger" role="alert">
            <p class="error_msg">#{name}#{arr}</p>
          </div>
        EOF
      end
    end
    html.html_safe
  end

end
