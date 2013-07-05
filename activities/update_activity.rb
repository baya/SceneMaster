class UpdateActivity < Ground::Activity

  include Protocol::CRUD
  
  data_reader :id, :role, :action, :content

  def call
    db[:activities].where(id: id).update(activity)
    db[:activities].where(id: id).first
  end

  private

  def activity
    @activity ||= {
          role: sanitize(role),
        action: sanitize(action),
       content: sanitize(content)
    }
  end
  
end
