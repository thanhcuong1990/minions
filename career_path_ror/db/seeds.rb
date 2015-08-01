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
  PersonalityType.create(name: "Realistic")
  PersonalityType.create(name: "Investigative")
  PersonalityType.create(name: "Artistic")
  PersonalityType.create(name: "Social")
  PersonalityType.create(name: "Enterprising")
  PersonalityType.create(name: "Conventional")
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

puts "Seeding completed."