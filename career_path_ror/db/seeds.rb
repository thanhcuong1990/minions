# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding data..."
if PersonalityType.count <= 0
  puts "Seeding personality types..."
  PersonalityType.create(name: "Realistic", description: "R (Realistic - Kỹ thuật). Người thuộc nhóm tính cách này thích hành động hơn là suy nghĩ hay nghiên cứu các lý thuyết trừu tượng. Giỏi giải quyết những việc đòi hỏi sự khéo léo của đôi bàn tay, phối hợp giữa các kỹ năng và thao tác vận động. Các phương thức giải quyết công việc thường đơn giản, dễ áp dụng và đạt được hiệu quả cụ thể. Có xu hướng quan tâm đến cơ khí, xây dựng, thích làm việc với các công cụ, máy móc, thiết bị. Thích môi trường làm việc gắn với thiên nhiên, xa bàn giấy.")
  PersonalityType.create(name: "Investigative", description: "I - Investigative (Nghiên cứu): Những người thuộc nhóm tính cách này thường thích suy nghĩ, quan sát hơn là hành động. Thông minh và có khả năng giải quyết các vấn đề khoa học. Thích và có khả năng tìm tòi, nghiên cứu những quy luật trong tự nhiên và đời sống xã hội. Độc lập sáng tạo, có tư duy phản biện, lật lại vấn đề. Thích trầm tư suy nghĩ hơn là tham gia các công tác xã hội sôi nổi. Tự tổ chức công việc của mình rất tốt, thường lập kế hoạch và thực hiện theo đúng kế hoạch đã đề ra, cũng bởi vì có tính kiên trì, tỉ mỉ và ngăn nắp.")
  PersonalityType.create(name: "Artistic", description: "A - Artistic (Nghệ thuật - nghệ sỹ): Nhóm người này có tính cách cởi mở, sáng tạo, nhạy cảm và giàu cảm xúc cùng với trí tưởng tượng phong phú. Không thích những khuôn mẫu, những nguyên tắc mà thích có sự độc đáo và riêng biệt. Có khả năng biểu đạt tình cảm của mình, thích được tham gia vào các hoạt động của con người, đặc biệt trong lĩnh vực văn hóa, nghệ thuật.")
  PersonalityType.create(name: "Social", description: "S – Social (Xã hội):Thích giúp đỡ người khác với tinh thần thiện nguyện, luôn mong muốn một xã hội tốt đẹp hơn. Biết lắng nghe một cách tích cực, biết giảng giải, huấn luyện cho mọi người. Thường tìm đọc các cuốn sách nhằm hoàn thiện bản thân. Thường tránh các công việc phải sử dụng máy móc, thiết bị, hay những công việc bàn giấy, đơn giản vì lý do các công việc đó không có nhiều cơ hội tiếp xúc, giao tiếp với mọi người.")
  PersonalityType.create(name: "Enterprising", description: "E - Enterprise (Người dám nghĩ dám làm - tiềm năng lãnh đạo): Đặc điểm nổi bật của nhóm tính cách này là sự tự tin, mạnh mẽ, thích phiêu lưu mạo hiểm, thích công việc có nhiều áp lực, có sự cạnh tranh. Có khả năng ăn nói và thuyết phục mọi người. Là người nhiều năng lượng, tham vọng nhưng cũng rất hòa đồng và thích giao du. Thường thành công khi tham gia làm kinh doanh, lãnh đạo hay làm chính trị.")
  PersonalityType.create(name: "Conventional", description: "C - Conventional (Mẫu người công chức - văn phòng): Những người thuộc nhóm tính cách này thường rất tin cậy do tính cẩn thận, tỉ mỉ, ngăn nắp. Thường đúng hẹn, luôn tuân thủ quy định, quy trình, coi trọng truyền thống, ứng xử chừng mực, ôn hòa. Thích làm việc với các con số, quản lý hồ sơ, sử dụng các thiết bị văn phòng. Thường giải quyết tốt các công việc khi đã được lập kế hoạch.")
end

if Question.count <= 0
  puts "Seeding questions..."

  Question.create(content: "Có tính tự lập", personality_id: 1)
  Question.create(content: "Có đầu óc thực tế", personality_id: 1)
  Question.create(content: "Dễ thích nghi, linh động", personality_id: 1)
  Question.create(content: "Vận hành máy móc thiết bị", personality_id: 1)
  Question.create(content: "Làm các công việc thủ công", personality_id: 1)
  Question.create(content: "Tiếp xúc với thiên nhiên, động, thực vật", personality_id: 1)
  Question.create(content: "Làm các công việc có tính thực hành", personality_id: 1)
  Question.create(content: "Thấy được kết quả công việc", personality_id: 1)
  Question.create(content: "Thích làm việc ngoài trời", personality_id: 1)
  Question.create(content: "Thiết kế, xây dựng", personality_id: 1)

  Question.create(content: "Tính tìm hiểu, khám phá", personality_id: 2)
  Question.create(content: "Có đầu óc phân tích", personality_id: 2)
  Question.create(content: "Tính Logic", personality_id: 2)
  Question.create(content: "Quan sát, phản ánh, nghiên cứu", personality_id: 2)
  Question.create(content: "Tổng hợp, khái quát, suy diễn", personality_id: 2)
  Question.create(content: "Điều tra, phân loại, kiểm tra đánh giá", personality_id: 2)
  Question.create(content: "Tự tổ chức công việc", personality_id: 2)
  Question.create(content: "Thực hiện những vấn đề phức tạp", personality_id: 2)
  Question.create(content: "Khả năng giải quyết các vấn đề", personality_id: 2)
  Question.create(content: "Khả năng giao tiếp bằng cách nói và viết", personality_id: 2)

  Question.create(content: "Dễ xúc động", personality_id: 3)
  Question.create(content: "Có óc tưởng tượng", personality_id: 3)
  Question.create(content: "Tính tự do, không khuôn mẩu, bốc đồng", personality_id: 3)
  Question.create(content: "Trình diễn, diễn xuất", personality_id: 3)
  Question.create(content: "Có thể chụp ảnh, vẽ, trang trí, điêu khắc", personality_id: 3)
  Question.create(content: "Năng khiếu âm nhạc", personality_id: 3)
  Question.create(content: "Khả năng viết, trình bày ý tưởng", personality_id: 3)
  Question.create(content: "Sáng tạo ý tưởng, chương trình mới", personality_id: 3)
  Question.create(content: "Thoải mái biểu lộ ý thích riêng", personality_id: 3)
  Question.create(content: "Khả năng lập kế hoạch", personality_id: 3)

  Question.create(content: "Tính thân thiện, giúp đỡ người khác", personality_id: 4)
  Question.create(content: "Thích gặp gỡ làm việc với mọi người", personality_id: 4)
  Question.create(content: "Lịch thiệp tử tế", personality_id: 4)
  Question.create(content: "Khuyên bảo, huấn luyện, giảng giải", personality_id: 4)
  Question.create(content: "Lắng nghe và sẵn sàng phục vụ", personality_id: 4)
  Question.create(content: "Chăm sóc sức khoẻ, phục hồi chức năng", personality_id: 4)
  Question.create(content: "Hoạt động vì mục tiêu xã hội, cái chung", personality_id: 4)
  Question.create(content: "Đóng góp để thế giới tươi đẹp hơn", personality_id: 4)
  Question.create(content: "Khả năng hoà giải, giải quyết sự việc", personality_id: 4)
  Question.create(content: "Khả năng phỏng vấn", personality_id: 4)

  Question.create(content: "Tính phiêu lưu, mạo hiểm", personality_id: 5)
  Question.create(content: "Tính quyết đoán", personality_id: 5)
  Question.create(content: "Năng động", personality_id: 5)
  Question.create(content: "Diễn đạt, tranh luận, thuyết phục", personality_id: 5)
  Question.create(content: "Quản lý, chỉ đạo, xem xét, đánh giá", personality_id: 5)
  Question.create(content: "Đặt ra mục tiêu, kế hoạch và quyết định", personality_id: 5)
  Question.create(content: "Gây ảnh hưởng đối với người khác", personality_id: 5)
  Question.create(content: "Cạnh tranh vượt lên người khác", personality_id: 5)
  Question.create(content: "Được sự kính trọng, vị nể", personality_id: 5)
  Question.create(content: "Khả năng quảng bá", personality_id: 5)

  Question.create(content: "Có đầu óc tổ chức, sắp xếp, ngăn nắp", personality_id: 6)
  Question.create(content: "Cẩn thận, tỉ mỉ", personality_id: 6)
  Question.create(content: "Chu đáo, chính xác, đáng tin cậy", personality_id: 6)
  Question.create(content: "Tính toán, so sánh, ghi chép số liệu", personality_id: 6)
  Question.create(content: "Lưu trữ, phân loại, cập nhật thông tin", personality_id: 6)
  Question.create(content: "Dự kiến về chi tiêu, ngân sách", personality_id: 6)
  Question.create(content: "Làm công việc có nhiệm vụ rõ ràng", personality_id: 6)
  Question.create(content: "Lên kế hoạch, điều phối công việc", personality_id: 6)
  Question.create(content: "Làm việc với con số, theo các quy định", personality_id: 6)
  Question.create(content: "Gặp gỡ & chào hỏi", personality_id: 6)
end

if Career.count <= 0
  puts "Seeding career..."

  Career.create(name: "Cơ khí & Xây dựng", description: "Kỹ sư cơ khí, chế tạo máy, luyện kim, điện lạnh, xây dựng, giao thông, thủy lợi, trắc địa, mỏ, địa chất, dầu khí, vận tải, hàng hải.", personality_id: 1)
  Career.create(name: "Điện, điện tử", description: "Kỹ sư điện, điện tử, phần cứng máy tính, viễn thông, tự động hóa.", personality_id: 1)
  Career.create(name: "Thiên nhiên & Nông nghiệp", description: "Kỹ sư nông nghiệp, lâm nghiệp, thủy sản, bác sỹ thú y.", personality_id: 1)
  Career.create(name: "Quân sự, thể thao và các dịch vụ bảo vệ", description: "Kỹ thuật quân sự, an ninh, vận động viên, huấn luyện viên, giám sát phòng cháy, chữa cháy, giám sát chất lượng, an toàn lao động.", personality_id: 1)
  Career.create(name: "Các nghề thợ", description: "Thợ sơn, thợ xây dựng, đúc, hàn, mộc, sửa chữa điện, điện tử, lái xe.", personality_id: 1)
  Career.create(name: "Các ngành nghề liên quan khác", description: "Kỹ thuật trong y học, vật lý trị liệu, kiến trúc sư, khí tượng thủy văn, hải dương học, dược, đầu bếp.", personality_id: 1)

  Career.create(name: "Nghiên cứu khoa học", description: "Nhà toán học, nhà vật lý học, nhà thiên văn học, nhà hóa học, nhà sinh vật học, sinh thái học (động vật, thực vật, thổ nhưỡng, nông học, lâm học, bệnh học thủy sản, thú y, bệnh học cây trồng).", personality_id: 2)
  Career.create(name: "Kỹ thuật công nghệ", description: "Công nghệ thông tin, công nghệ sinh học, khoa học môi trường , khí tượng thủy văn, hải dương học, nhà nghiên cứu địa lý, địa chất, nghiên cứu xây dựng, nghiên cứu vật liệu mới, chuyên gia dinh dưỡng, kỹ sư hóa thực phẩm (công nghệ thực phẩm).", personality_id: 2)
  Career.create(name: "Y khoa", description: "Bác sỹ (nhi khoa, đa khoa, nha khoa, phẫu thuật / chỉnh hình, tâm thần), dược sỹ, y học cổ truyền.", personality_id: 2)
  Career.create(name: "Các ngành nghề liên quan", description: "Khoa học xã hội (nhà tâm lý học, nhà ngôn ngữ học, nhà xã hội học, đô thị học, nhà sử học, khảo cổ học, nhà nhân học, nhà văn hóa, Việt Nam học, quốc tế học, chính trị học, triết học), luật sư, an ninh điều tra, giám định pháp y, nhà kinh tế học, phân tích tài chính, nghiên cứu thị trường, thống kê dự báo, nghiên cứu và quy hoạch đô thị (kiến trúc sư).", personality_id: 2)

  Career.create(name: "Viết & Truyền thông", description: "Nhà văn, nhà thơ, nhà báo (phóng viên, biên tập viên, bình luận viên), nhạc sỹ, nhà lý luận phê bình: văn học, âm nhạc, điện ảnh; người sáng tác quảng cáo, tiếp thị, thiết kế mẫu mã hàng hóa, tổ chức triển lãm, sự kiện, thiết kế trưng bày.", personality_id: 3)
  Career.create(name: "Nghệ thuật biểu diễn", description: "Ca sỹ, diễn viên: điện ảnh,truyền hình, sân khấu; diễn viên múa, biên đạo múa, biểu diễn nhạc cụ, chỉ huy dàn nhạc, đạo diễn, chỉ đạo nghệ thuật, dẫn chương trình, phát thanh viên.", personality_id: 3)
  Career.create(name: "Nghệ thuật hình ảnh & Tạo hình", description: "Hội họa (họa sỹ), nhà mỹ thuật, điêu khắc, đồ họa vi tính, nhiếp ảnh gia, thiết kế thời trang, kiến trúc sư, thiết kế nội thất, ngoại thất, thiết kế phong cảnh.", personality_id: 3)
  Career.create(name: "Các ngành nghề liên quan", description: "Nghệ thuật ẩm thực, quay phim, bảo tồn, bảo tàng, thủ công mỹ nghệ.", personality_id: 3)

  Career.create(name: "Khoa học xã hội", description: "Nhà tâm lý học, nhà ngôn ngữ học, nhà xã hội học, đô thị học, nhà sử học, khảo cổ học, nhà nhân học, nhà văn hóa, Việt Nam học, quốc tế học, chính trị học, triết học.", personality_id: 4)
  Career.create(name: "Tư vấn & Giúp đỡ", description: "Công tác xã hội, công tác đoàn, hội, cứu trợ xã hội, tình nguyện viên, chăm sóc trẻ em, người già, người khuyết tật, bị thương, nhân viên phục vụ, chăm sóc khách hàng.", personality_id: 4)
  Career.create(name: "Giáo dục & Đào tạo", description: "Tư vấn hướng nghiệp, tư vấn giáo dục, tư vấn tâm lý, giáo viên, giảng viên, đào tạo các kiến thức, kỹ năng cho người lao động, an toàn lao động, huấn luyện viên thể thao.", personality_id: 4)
  Career.create(name: "Dịch vụ chăm sóc sức khỏe", description: "Bác sỹ, y tá, điều dưỡng, chuyên viên vật lý trị liệu, y tế công cộng, y tế học đường, y học dự phòng, hộ sinh, dinh dưỡng học…", personality_id: 4)
  Career.create(name: "Các ngành nghề liên quan", description: "Tôn giáo và tâm linh, thông tin, truyền thông, báo chí, xuất bản, du lịch, quản lý di tích, danh thắng, xã hội học, dịch vụ xã hội.", personality_id: 4)

  Career.create(name: "Quản lý, kinh doanh", description: "Quản trị kinh doanh, quản trị doanh nghiệp, quản lý kinh tế, quản trị nhân sự, đại lý cung cấp các sản phẩm, môi giới chứng khoán, bất động sản, quản trị trung tâm đào tạo / trường học, quản trị công ty du lịch, khách sạn, nhà hàng.", personality_id: 5)
  Career.create(name: "Marketing và Bán hàng", description: "Nghiên cứu thị trường, tiếp thị, bán hàng, truyền thông, quan hệ công chúng, tổ chức sự kiện.", personality_id: 5)
  Career.create(name: "Chính trị và Diễn thuyết", description: "Nhà ngoại giao, chính trị gia, diễn giả…", personality_id: 5)
  Career.create(name: "Luật", description: "Luật sư, trợ lý pháp lý, sỹ quan cảnh sát.", personality_id: 5)
  Career.create(name: "Các ngành nghề liên quan", description: "Tư vấn tài chính, tín dụng, kế toán trưởng.", personality_id: 5)

  Career.create(name: "Quản trị văn phòng", description: "Quản trị văn phòng, thư ký văn phòng, hành chính, quản lý hồ sơ, nhân viên đánh máy, biên soạn hồ sơ, nhân viên lễ tân, điện thoại viên.", personality_id: 6)
  Career.create(name: "Tài chính, kế toán, đầu tư", description: "Tài chính, ngân hàng, đầu tư, kế toán, kiểm toán, nhân viên thuế, nhân viên thu ngân, quản lý quỹ, bán lẻ.", personality_id: 6)
  Career.create(name: "Thư viện, thông tin", description: "Thống kê, lưu trữ, thư viện, hệ thống thông tin.", personality_id: 6)
  Career.create(name: "Các ngành nghề liên quan", description: "Phát triển phần mềm, biên dịch, phiên dịch, giáo viên mầm non, một số vị trí công chức nhà nước, thanh tra, kiểm tra, nghề thợ thủ công.", personality_id: 6)
end

puts "Seeding completed."