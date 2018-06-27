## Rails CRUD

### 1. ORM (Object Relational Mapper)
- Rails에서는 [ActiveRecord](https://guides.rorlab.org/active_record_basics.html)를 활용한다.
### 2. Controller 생성
```bash
$ rails g controller post index new create show edit update destroy
```
### 3. Model 생성
```bash
$ rails g model post
```
  - `app/model/post.rb`
  - `db/migrate/20180619_create_posts.rb`
- `migration 파일` 변경
```ruby
# db/migrate/migrate/20180619_create_posts.rb
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamps null: false
    end
  end
end
```

```bash
$rake db:migrate
#진짜 table을 만든다
== 20180619043119 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0089s
== 20180619043119 CreatePosts: migrated (0.0098s) =============================

```
  - `db/schema.rb`에 반영이 되었는지 확인


## CRUD
  - Create : `new`, `create`
  - Read : `show`
  - Update : `edit`, `update`
  - Destroy : `destroy`

- Create
```bash
irb(main):001:0 > Post.create(title: "제목", body: "내용")
   (0.1ms)  begin transaction
  SQL (5.3ms)  INSERT INTO "posts" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "제목"], ["body", "내용"], ["created_at", "2018-06-19 08:29:59.313013"], ["updated_at", "2018-06-19 08:29:59.313013"]]
   (3.9ms)  commit transaction
=> #<Post id: 1, title: "제목", body: "내용", created_at: "2018-06-19 08:29:59", updated_at: "2018-06-19 08:29:59">

```

- Read
```bash
irb(main):001:0 > Post.find(id)
   (0.1ms)  begin transaction
  SQL (5.3ms)  INSERT INTO "posts" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "제목"], ["body", "내용"], ["created_at", "2018-06-19 08:29:59.313013"], ["updated_at", "2018-06-19 08:29:59.313013"]]
   (3.9ms)  commit transaction
=> #<Post id: 1, title: "제목", body: "내용", created_at: "2018-06-19 08:29:59", updated_at: "2018-06-19 08:29:59">
irb(main):002:0> Post.find(1)
  Post Load (1.9ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT 1  [["id", 1]]
=> #<Post id: 1, title: "제목", body: "내용", created_at: "2018-06-19 08:29:59", updated_at: "2018-06-19 08:29:59">


```
- update
```bash
irb(main):001:0 > post = Post.find(id)
irb(main):002:0 > post.update(title: "변경", body: "변경")
irb(main):003:0> Post.find(1).update(title: "변경", body: " 변경")
  Post Load (1.8ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT 1  [["id", 1]]
   (0.1ms)  begin transaction
  SQL (8.1ms)  UPDATE "posts" SET "title" = ?, "body" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["title", "변경"], ["body", "변경"], ["updated_at", "2018-06-19 08:31:14.239322"], ["id", 1]]
   (5.7ms)  commit transaction
=> true
```

- Destroy
```bash
irb(main):001:0 > Post.find(id).destroy
  Post Load (1.9ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT 1  [["id", 1]]
   (0.1ms)  begin transaction
  SQL (6.5ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 1]]
   (5.6ms)  commit transaction
=> #<Post id: 1, title: "변경", body: "변경", created_at: "2018-06-19 08:29:59", updated_at: "2018-06-19 08:31:14">
```

## [Rails flash message](https://guides.rorlab.org/action_controller_overview.html#flash)

```ruby
def destroy
  flash[:alert] = "삭제되었습니다."
end
```
```erb
<%= flash[:alert]%>
```

## [Rails partial](https://guides.rorlab.org/layouts_and_rendering.html#%ED%8C%8C%EC%85%9C-partial-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)

`app/views/layout/_flash.html.erb`
```erb
<%= render 'layout/flash'%>
```
