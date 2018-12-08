class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :completed, :edit, :update, :destroy]


  def index
    @todos = Todo.all
  end


  def show

  end


  def new
    @todo = Todo.new
  end


  def edit

  end


  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
       if @todo.save
         format.html { redirect_to todos_url, notice: 'Todo creado.' }
         format.json { render :show, status: :created, location: @todo }
       else
         format.html { render :new }
         format.json { render json: @todo.errors, status: :unprocessable_entity }
       end
     end

  end



    def update

      @todo.update(todo_params)
      redirect_to todos_path
      end


      def completed

      end

      def list

        @todos = Todo.all


      end



  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private

    def todo_params
      params.require(:todo).permit(:description, :completed)
    end


    def set_todo
      @todo = Todo.find(params[:id])
    end
  end