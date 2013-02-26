class LandingPageController < ApplicatonController

  def index

  end


  def create
    WaitingList.create(:email => params[:email])
  end
end