# bookworm
online book reading


Collabing project

features:
- Site which releases books, readable by chapter

Users
	- can subscribe to novel and get updates
	- can post comments on chapters
	has_many :books

Books
	/books/:book_code
	/books - list all books, multiple categories
	/books?category=fantasy = list only fantasy books
	- search box
		- as you fill out category/other
		- ajax request to find categories with that name
	- doesn't require login to view books
	has_many :chapters
	belongs_to :user


Chapters
	- __ number of free chapters
	- require membership/login to view rest of chapters
	belong_to :book
	- only in 1 language but will later support multiple

	chapters#show - /books/:book_slug/chapters/:chapter_id
	chapters#show - /books/:book_slug/chapters/:id?language=fr

	has_many :comments

	- admin submits the chapter content
	- admin grants user (author) so you can create a book then give access to add chapters to that specific book

Authors, 
role = 4

gives user_id access to book_id permissions
books_users join table
user_id | book_id 


Comments
	belongs_to :chapter
	- user has to be logged_in
	- user can only edit their own comments

Ratings
	- user can rate a book
	- list of books by rating on homepage


database

user uses has_secure_password
user
	- id
	- name
	- email
	- password_digest
	- role, default: 1 "basic member"
	- uid "oauth login"
	- verification_code
	- verified (boolean), default: false

books
	- id
	- title
	- author_id
	- timestamps
	- slug/short_code
	- description
	- cover_img :string

chapters
	- id
	- chapter_title
	- language, default: 'en'
	- status, default: 'unpublished'
	- release_date (datetime)
	- content
	- chapter_number
	- book_id

chapters_comments
comment_id | chapter_id | parent_comment_id

comments
	- id
	- body
	- user_id
	- timestamps

chapters.comments , through: chapters_comments


gems:
	rails-rspec - testing
	bcrypt - has_secure_password
	pry
	capybara
	whater Oauth gems are required


rails new <> -T
install rspec-rails gem 
bundle install
rails g rspec:install


lizzie: in charge of user model/ login system/ oauth
jordan : books/chapters
