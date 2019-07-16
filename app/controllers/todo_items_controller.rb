class TodoItemsController < ApplicationController

	before_action :set_todo_list


	def new
	end


	def create
		@todo_item = @todo_list.todo_items.build(todo_item_params)

		if @todo_item.save
			flash[:notice]="Item successfully created"
		else
			flash[:notice]="Failed to create an item,enter valid credentials"
		end
		redirect_to todo_list_path(@todo_list) 
	end


	def update
		if @todo_list.todo_items.update(todo_item_params)
			flash[:notice] = "Item successfully updated"
		else
			flash[:notice] = "Failed to update item"
		end
		redirect_to todo_list_path(@todo_list)
	end


	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])

		if @todo_item.destroy
			flash[:notice]= "Item successfully deleted"
		else
			flash[:notice]= "Failed to delete item"
		end
		redirect_to todo_list_path(@todo_list) 
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])

	end

	def todo_item_params
		params.require(:todo_item).permit(:content)
	end

end
