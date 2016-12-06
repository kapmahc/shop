GEM_ROOT = File.expand_path('../..', __FILE__)

# http://www.currency-iso.org/dam/downloads/lists/list_one.xml
# if Shop::Currency.count == 0
#   doc = File.open("#{GEM_ROOT}/config/iso4217.xml") { |f| Nokogiri::XML(f) }
#
#   doc.xpath('//CcyNtry').each do |item|
#     cur = Shop::Currency.new country: item.at_css('CtryNm').text,
#                              name: item.at_css('CcyNm').text
#
#     cid = item.at_css('Ccy')
#     unless cid.nil?
#       cur.cid = cid.text
#     end
#
#     code = item.at_css('CcyNbr')
#     unless code.nil?
#       cur.code = code.text
#     end
#
#     units = item.at_css('CcyMnrUnts')
#     unless units.nil?
#       cur.units = units.text
#     end
#
#     cur.save
#   end
#
# end

# https://raw.githubusercontent.com/lukes/ISO-3166-Countries-with-Regional-Codes/master/all/all.csv
# if Shop::Country.count == 0
#   doc = File.open("#{GEM_ROOT}/config/iso3166.xml") { |f| Nokogiri::XML(f) }
#
#   doc.xpath('//country').each do |item|
#     cry = Shop::Country.new name: item['name'],
#                             alpha_2: item['alpha-2'],
#                             alpha_3: item['alpha-3'],
#                             code: item['country-code'],
#                             iso3166_2: item['iso_3166-2'],
#                             region: item['region'],
#                             sub_region: item['sub-region'],
#                             region_code: item['region-code'],
#                             sub_region_code: item['sub-region-code']
#
#     cry.save
#   end
# end

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
  ].each { |s| Shop::ShippingMethod.create s }
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
  ].each { |s| Shop::PaymentMethod.create s }
end