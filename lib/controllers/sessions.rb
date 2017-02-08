class MakersBnB < Sinatra::Base

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = ['Email and/or password are/is incorrect']
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:sign_out] = 'See you later!'
    redirect '/spaces'
  end

end
