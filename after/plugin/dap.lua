
vim.keymap.set('n', '<leader>bb', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>bc', function() require'dap'.continue() end)
vim.keymap.set('n', '<leader>br', function() require'dap'.run_last() end)
vim.keymap.set('n', '<leader>bs', function() require'dap'.step_into() end)
vim.keymap.set('n', '<leader>bss', function() require'dap'.step_over() end)

-- Nodejs config
local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
} 
local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.adapters.bashdb = {
  type = 'executable';
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
  name = 'bashdb';
}
dap.configurations.sh = {
  {
    type = 'bashdb';
    request = 'launch';
    name = "Launch file";
    showDebugOutput = true;
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
    trace = true;
    file = "${file}";
    program = "${file}";
    cwd = '${workspaceFolder}';
    pathCat = "cat";
    pathBash = "/bin/bash";
    pathMkfifo = "mkfifo";
    pathPkill = "pkill";
    args = {};
    env = {};
    terminalKind = "integrated";
  }
}

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
    },
}
