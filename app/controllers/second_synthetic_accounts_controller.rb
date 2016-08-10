class SecondSyntheticAccountsController < ApplicationController
  before_action :set_second_synthetic_account, only: [:show, :edit, :update, :destroy]

  # GET /second_synthetic_accounts
  # GET /second_synthetic_accounts.json
  def index
    @second_synthetic_accounts = SecondSyntheticAccount.all
  end

  # GET /second_synthetic_accounts/1
  # GET /second_synthetic_accounts/1.json
  def show
  end

  # GET /second_synthetic_accounts/new
  def new
    @second_synthetic_account = SecondSyntheticAccount.new
    
  end

  # GET /second_synthetic_accounts/1/edit
  def edit
  end

  # POST /second_synthetic_accounts
  # POST /second_synthetic_accounts.json
  def create
    @second_synthetic_account = SecondSyntheticAccount.new(second_synthetic_account_params)

    respond_to do |format|
      if @second_synthetic_account.save
        format.html { redirect_to wizard_index_path, notice: 'Conta criada com sucesso.' }
        
      else
        format.html { render :new }
        format.json { render json: @second_synthetic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /second_synthetic_accounts/1
  # PATCH/PUT /second_synthetic_accounts/1.json
  def update
    respond_to do |format|
      if @second_synthetic_account.update(second_synthetic_account_params)
        format.html { redirect_to @second_synthetic_account, notice: 'Second synthetic account was successfully updated.' }
        format.json { render :show, status: :ok, location: @second_synthetic_account }
      else
        format.html { render :edit }
        format.json { render json: @second_synthetic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_synthetic_accounts/1
  # DELETE /second_synthetic_accounts/1.json
  def destroy
    @second_synthetic_account.destroy
    respond_to do |format|
      format.html { redirect_to second_synthetic_accounts_url, notice: 'Second synthetic account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second_synthetic_account
      @second_synthetic_account = SecondSyntheticAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def second_synthetic_account_params
      params.require(:second_synthetic_account).permit(:code, :name, :description, :balance, :synthetic_account_id)
    end
end
