class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def new
      @board = Board.new
    end

    def create
       board = Board.create(board_params)
       redirect_to board
    end

    def show
        @board = Board.find(params[:id])
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        board = Board.find(params[:id])
        board.update(board_params)
        #viewを作成しないため,@boardのようなインスタンス変数ではなく
        #ローカル変数に代入してる

        redirect_to board
        #特定のモデルの詳細画面にリダイレクトする場合
        #引数にオブジェクトを指定するだけで転送可能
        #/boards/:idのパスにリダイレクトされる
    end

    def destroy
        board = Board.find(params[:id])
        board.delete

        redirect_to boards_path
    end

    private
    def board_params
        params.require(:board).permit(:name, :title, :body)
    end
end