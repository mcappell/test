require 'sinatra'
require 'sequel'

DB = Sequel.sqlite('recall.db')

class Note < Sequel::Model
    plugin :schema
    set_schema do
      primary_key :id
      varchar :content, :empty => false
      boolean :complete, :empty => false, :default => false
      datetime :created_at
      datetime :updated_at

    end
    create_table unless table_exists?

end

get '/' do
  # @notes = Note.all :order => :id.desc
  @notes = Note.reverse_order(:id)
  @title = 'All Notes'
  erb :home

end
get '/hello' do
  "test"
end

post '/' do
  notes = DB[:notes]
  notes.insert(:content => params[:content], :created_at => Time.now, :updated_at => Time.now)
  redirect '/'
end

put '/:id' do
  notes = DB[:notes]
  complete =  params[:complete] ? 1 : 0
  notes.where('id = ?', :id).update(:content => params[:content], :complete => complete , :updated_at => Time.now)
  redirect '/'
end

get '/:id' do
  notes = DB[:notes]
  @note = notes.where(:id => params[:id]).first
  @title = "Edit note #{params[:id]}"
  erb :edit

end
