class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      Folder.create(name: "Loose Questions", user_id: resource.id, loose: "true")
    end
  end
end
