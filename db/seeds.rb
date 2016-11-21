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

if Shop::Country.count == 0
  [
      {
          name: 'United States of America',
          states: ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'],
      },
      {
          name: '中华人民共和国',
          states: %w(北京市 天津市 上海市 重庆市 河北省 山西省 辽宁省 吉林省 黑龙江省 江苏省 浙江省 安徽省 福建省 江西省 山东省 河南省 湖北省 湖南省 广东省 海南省 四川省 贵州省 云南省 陕西省 甘肃省 青海省 台湾省 内蒙古自治区 广西壮族自治区 西藏自治区 宁夏回族自治区 新疆维吾尔自治区 香港特别行政区 澳门特别行政区),
      }
  ].each do |c|
    cry = Shop::Country.create name: c.fetch(:name)
    c.fetch(:states).each {|s| Shop::State.create country: cry, name: s}
  end
end

if Shop::ShippingMethod.count == 0
  [
      {
          name: 'UPS',
          tracking: 'https://www.ups.com/WebTracking/track',
      },
      {
          name: 'USPS',
          tracking: 'https://tools.usps.com/go/TrackConfirmAction_input',
      },
      {
          name: 'Fedex',
          tracking: 'https://www.fedex.com/apps/fedextrack/',
      },
      {
          name: '中国邮政速递',
          tracking: 'http://www.ems.com.cn/mailtracking/you_jian_cha_xun.html',
      }
  ].each {|s| Shop::ShippingMethod.create s}
end

if Shop::PaymentMethod.count == 0
  [
      {
          name: 'Paypal',
          flag: 'paypal',
          description: 'https://www.paypal.com/',
      },
      {
          name: '支付宝',
          flag: 'alipay',
          description: 'https://intl.alipay.com/',
      },
      {
          name: '微信支付',
          flag: 'wechat',
          description: 'https://pay.weixin.qq.com/',
      },
  ].each {|s| Shop::PaymentMethod.create s}
end