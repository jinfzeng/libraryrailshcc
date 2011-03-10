# app/controllers/author_books_controller.rb
class AuthorBooksController < ApplicationController
  def index
    @authorbooks = AuthorBook.all
  end
  
  def new
  end
  
  def create
    first_name = params[:author_book][:first_name]
    last_name = params[:author_book][:last_name]
    email = params[:author_book][:email]
    title = params[:author_book][:title]
    isbn = params[:author_book][:isbn]
    conn = ActiveRecord::Base.connection
    sql = "insert into author_book_view (first_name," +
      "last_name,email,title,isbn) values ('" + first_name +
      "','" + last_name + "','" + email + "','" + title +
      "','" + isbn = "')"
    conn.insert(sql)
    redirect_to :controller => "author_books", :action => "index"
  end
  
  def findByTitle
    @authorbooks = AuthorBook.find_all_by_title(params[:title])
  end

end
