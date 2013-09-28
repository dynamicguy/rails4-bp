@text_1 = "Unsafe content <script>alert(1)</script>!!! ' ' \" "
@text_2 = "<script>alert('!!! Some Secret word !!!')</script> It's should be removed from JSON"

@counter_1 = 0

def build_test_tree klass = Page, count = 5
  count.times do |book_i|
    var = klass.new
    var.title        = "Book #{book_i}"
    var.content      = @text_1 + Faker::Lorem.sentence(5)
    var.secret_field = @text_2
    var.save

    @counter_1 = @counter_1.next
    puts '.' + @counter_1.to_s

    count.times do |chapter_i|
      var1 = klass.new
      var1.title        = "Chapter #{chapter_i}"
      var1.content      = @text_1 + Faker::Lorem.sentence(5)
      var1.secret_field = @text_2
      var1.save
      var1.move_to_child_of var

      @counter_1 = @counter_1.next
      puts '..' + @counter_1.to_s

      count.times do |page_i|
        var2 = klass.new
        var2.title        = "Page #{page_i}"
        var2.content      = @text_1 + Faker::Lorem.sentence(25)
        var2.secret_field = @text_2
        var2.save

        var2.move_to_child_of var1
        @counter_1 = @counter_1.next
        puts '...' + @counter_1.to_s
      end
    end
  end

  puts klass.to_s
  puts klass.count
end

#build_test_tree Page, 4

Category.delete_all
build_test_tree Category, 4

