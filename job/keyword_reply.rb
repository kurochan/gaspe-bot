class KeywordReplyJob
  def call(status)
    return unless status.text
    pattern = {
      'くそ' => ['くそじゃない！くっそ！', 'くそわろ'],
    }
    pattern.each do |str|
      if status.text.include? str
        puts "Keyword reply"
        # TODO リプライ機能実装
        break
      end
    end
  end
end
