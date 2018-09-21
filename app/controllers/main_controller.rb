class MainController < ApplicationController
  
  #чтобы отобразить все todos и projects  
  def index
    @projects = Project.all
    @todos = Todo.all
  end
  
  
  #чтобы обновить состояние todo - (выполнено или нет)
  def update
  end
  
  def new
    @todo = Todo.new
  end
  
  
  
  #чтобы создать новый todo
  def  create
    @todo = Todo.new(todo_params)
  if @todo.save
    redirect_to :back
  else
    render 'new'
  end
  end
  
  private

  def todo_params
    params.require(:todo).permit(:text, :project_id)
  end
end