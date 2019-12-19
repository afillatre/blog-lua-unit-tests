local _M = {}
local get_uri_args = ngx.req.get_uri_args

_M.getName = function()
  return get_uri_args()["name"]
end

_M.set_ngx = function(mock_ngx)
  
  if type(mock_ngx) ~= "table" then
    return
  end
  
  get_uri_args = mock_ngx.req.get_uri_args
end

return _M