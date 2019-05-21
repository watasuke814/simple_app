class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

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
    end

    def edit
    end

    def update
        @board.update(board_params)
        #viewを作成しないため,@boardのようなインスタンス変数ではなく
        #ローカル変数に代入してる

        redirect_to @board
        #特定のモデルの詳細画面にリダイレクトする場合
        #引数にオブジェクトを指定するだけで転送可能
        #/boards/:idのパスにリダイレクトされる
    end

    def destroy
        @board.delete

        redirect_to boards_path
    end

    private
    def board_params
        params.require(:board).permit(:name, :title, :body)
    end

    def set_target_board
        @board = Board.find(params[:id])
    end
end