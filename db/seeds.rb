require 'open-uri'

if Shop::Currency.count == 0
  url = 'http://www.currency-iso.org/dam/downloads/lists/list_one.xml'

  doc = Nokogiri::XML open(url)

  # fn = Rails.root.join('tmp', 'iso4217.xml')
  # unless File.exists?(fn)
  #   open(fn, 'wb') do |file|
  #     file << open(url).read
  #   end
  # end
  # doc = File.open(fn) { |f| Nokogiri::XML(f) }

  doc.xpath('//CcyNtry').each do |item|
     cur = Shop::Currency.new country: item.at_css('CtryNm').text,
                           name: item.at_css('CcyNm').text

     cid = item.at_css('Ccy')
     unless cid.nil?
       cur.cid = cid.text
     end

     code = item.at_css('CcyNbr')
     unless code.nil?
       cur.code = code.text
     end

     units = item.at_css('CcyMnrUnts')
     unless units.nil?
       cur.units = units.text
     end

     cur.save
  end


end