local _M = {}

_M.mock_ngx = function(method, request_uri, headers, query_params)
  
  local headers_mt = {
    __index = function(t, k)
      return rawget(t, string.upper(k)) or rawget(t, string.lower(k))
    end
  }
  
  local query_params_mt = {
    __index = function(t, k)
      return rawget(t, string.upper(k)) or rawget(t, string.lower(k))
    end
  }
  
  local _ngx
  _ngx = {
    re = ngx.re,
    var = setmetatable({
      request_uri = request_uri,
    }, {
      __index = function(_, key)
        if key == "http_host" then
          return headers.host
        end
      end
    }),
    req = {
      get_method = function()
        return method
      end,
      get_headers = function()
        return setmetatable(headers, headers_mt)
      end,
      -- We only need this one for the blog article, but other things are relevant as well
      -- to understand what's going on
      get_uri_args = function()
        return setmetatable(query_params, query_params_mt)
      end
    }
  }
  
  return _ngx
end

return _M