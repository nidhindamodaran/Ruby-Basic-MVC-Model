class SessionController
  def initialize(action)
    @action = action
  end
  def call(action, id)
    "hello #{action}"
  end
end
