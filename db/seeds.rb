User.create([
  { :id => 1, :email => "zlobarik@tut.by", :password => "12345678", :password_confirmation => "12345678", :name => "Andrei", :admin => true},
  { :id => 7, :email => "2@tut.by", :password => "12345678", :password_confirmation => "12345678", :name => "Test 1", :admin => false},
  { :id => 8, :email => "1@tut.by", :password => "12345678", :password_confirmation => "12345678", :name => "Test 2", :admin => false},
  { :id => 10, :email => "3@tut.by", :password => "12345678", :password_confirmation => "12345678", :name => "Test 3", :admin => false}
], :without_protection => true )



Timetable.create([
  { :user_id => 7, :date => "2013-06-10", :task_id => 5, :comment => "sgdgss", :hours => 55},
  { :user_id => 7, :date => "2013-06-12", :task_id => 444, :comment => "134", :hours => 5},
  { :user_id => 7, :date => "2013-06-17", :task_id => 444, :comment => "ffff", :hours => 3},
  { :user_id => 7, :date => "2013-06-13", :task_id => 3213, :comment => "133", :hours => 2},
  { :user_id => 7, :date => "2013-06-13", :task_id => 2333, :comment => "ddd", :hours => 12},
  { :user_id => 8, :date => "2013-05-13", :task_id => 444, :comment => "awsda", :hours => 11},
  { :user_id => 7, :date => "2013-06-13", :task_id => 2222, :comment => "add", :hours => 1},
  { :user_id => 8, :date => "2013-06-17", :task_id => 234, :comment => "44", :hours => 2},
  { :user_id => 8, :date => "2013-06-17", :task_id => 2142, :comment => "22", :hours => 23},
  { :user_id => 8, :date => "2013-06-17", :task_id => 22, :comment => "qqwe", :hours => 2},
  { :user_id => 10, :date => "2013-06-18", :task_id => 1111, :comment => "asasa", :hours => 2},
  { :user_id => 10, :date => "2013-06-25", :task_id => 333, :comment => "adad", :hours => 1},
  { :user_id => 10, :date => "2013-06-25", :task_id => 3333, :comment => "aaaa", :hours => 1},
  { :user_id => 10, :date => "2013-06-25", :task_id => 12, :comment => "aa", :hours => 2},
  { :user_id => 10, :date => "2013-06-25", :task_id => 333, :comment => "12ass", :hours => 3},
  { :user_id => 10, :date => "2013-06-25", :task_id => 1, :comment => "1", :hours => 1},
  { :user_id => 8, :date => "2013-06-26", :task_id => 222, :comment => "ads", :hours => 2}
], :without_protection => true )


