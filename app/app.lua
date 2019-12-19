local _M = {}

_M.getName = function()
  return ngx.req.get_uri_args()["name"]
end

return _M