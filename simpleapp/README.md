# Hello, Rails

1. `vagrant` 서버 실행
*반드시 `Vagrantfile`이 있는 곳에서 실행해야함(/사용자/vagrant)*
```bash
$ vagrant up
$ vagrant ssh
$ cd /vagrant
```

2. 새로운 Rails 프로젝트 생성
```bash
$ rails new projectname
$ cd projectname
```

3. Rails 서버 실행
```bash
$ rails server
$ rails s
# 둘 다 가능
```

4. Controller 생성
```bash
rails generate home index
rails g home
# 이름 action1이름 action2이름
```

5. routes 및 페이지 설정
```ruby
# config/routes
# localhost:3000/home/index로 요청이오면, home#index를 실행하세요
get 'home/index' => 'home#index'
```
```ruby
#app/Controllers/home_controller.rb
def index
end
```
```html
<!-- views/home/index.html.erb -->
hello world~~!!
```

6. layout
```erb
<!-- 모든 html.erb file은 기본적으로 app/views/layout/application.html.erb의 영향을 받는다. -->
<html>
  <head>
  </head>
  <body>
    <%=yield%>
  </body>
</html>
```
### form으로 데이터 받기
1. `routes.rb`
```ruby
# config/routes.rb
get '/geme' => 'ramdom#gmae'
get '/gameresult' => 'ramdom#gameresult'
```
2. `random_controller.rb`
```ruby
# app/Controllers/random_controller.rb
def game

end

def gameresult
  @username = params[:name]
end
```

3. `view` 파일 만들기
```erb
<!--app/views/random/game.html.erb-->
<form action="/gameresult">
  <input name="name"/>
</form>
```
```erb
<!--app/views/random/gameresult.html.erb-->
<%=@name%>
```
