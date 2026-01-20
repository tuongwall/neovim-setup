local M = {}

local job_cache = {}

local function log(msg, level)
  vim.notify("live-server.nvim: " .. msg, level or vim.log.levels.INFO)
end

local function is_windows()
  return vim.fn.has("win32") == 1
end

local function normalize(dir)
  return vim.fn.fnamemodify(dir, ":p")
end

local function find_cached_dir(dir)
  dir = normalize(dir)
  local cur = dir
  while not job_cache[cur] do
    if cur == "/" or cur:match("^[A-Z]:\\$") then
      return nil
    end
    cur = vim.fn.fnamemodify(cur, ":h")
  end
  return cur
end

local function is_running(dir)
  local cached = find_cached_dir(dir)
  return cached and job_cache[cached]
end

M.config = {
  args = { "--port=5500" },
}

M.setup = function(user_config)
  M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

  local exe = is_windows() and "live-server.cmd" or "live-server"
  if vim.fn.executable(exe) == 0 then
    log("live-server not found. Run: npm install -g live-server", vim.log.levels.ERROR)
    return
  end

  local function get_dir(arg)
    local d = arg ~= "" and arg or "%:p:h"
    return normalize(vim.fn.expand(d))
  end

  vim.api.nvim_create_user_command("LiveServerStart", function(o)
    M.start(get_dir(o.args))
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("LiveServerStop", function(o)
    M.stop(get_dir(o.args))
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("LiveServerToggle", function(o)
    M.toggle(get_dir(o.args))
  end, { nargs = "?" })
end

M.start = function(dir)
  dir = normalize(dir)

  if is_running(dir) then
    log("already running")
    return
  end

  local exe = is_windows() and "live-server.cmd" or "live-server"

  local cmd = { exe }
  vim.list_extend(cmd, M.config.args)
  table.insert(cmd, dir)

  local job_id = vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,

    on_stderr = function(_, data)
      if data and data[1] ~= "" then
        log(data[1], vim.log.levels.ERROR)
      end
    end,

    on_exit = function(_, code)
      job_cache[dir] = nil
      if code ~= 143 then
        log("stopped (code " .. code .. ")")
      end
    end,
  })

  if job_id <= 0 then
    log("failed to start", vim.log.levels.ERROR)
    return
  end

  job_cache[dir] = job_id
  log("started at http://127.0.0.1:5500")

  local file = vim.fn.expand("%:t")
  if file:match("%.html$") then
    vim.defer_fn(function()
      local url = "http://127.0.0.1:5500/" .. file
      vim.fn.jobstart({ "xdg-open", url }, { detach = true })
    end, 500)
  end
end

M.stop = function(dir)
  local cached = find_cached_dir(dir)
  if cached then
    vim.fn.jobstop(job_cache[cached])
    job_cache[cached] = nil
    log("stopped")
  end
end

M.toggle = function(dir)
  if is_running(dir) then
    M.stop(dir)
  else
    M.start(dir)
  end
end

return M
