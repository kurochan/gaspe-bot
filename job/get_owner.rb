class GetOwnerJob
  def call
    $owner = TwitterClient.instance.user
  end
end
GetOwnerJob.new.call
