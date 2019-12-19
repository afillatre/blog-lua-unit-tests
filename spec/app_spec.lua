local app = require("app/app")

describe("Get the user's name", function()
  it("should return nil if name is not provided", function()
    assert.are.equal(nil, app.getName())
  end)
  
  it("should return the provided name", function()
    -- ??? How to make a request here ????
    assert.are.equal("alex", app.getName())
  end)
end)