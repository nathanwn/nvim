require("nathan-wien.utils").editor.set_buf_indent(2)
vim.g.pascal_fpc = 1

local match_against_compile_file_format = function(line)
  local pattern = "Compiling (.+)"
  local results = { string.match(line, pattern) }
  if vim.tbl_count(results) > 0 then
    return results[1]
  end
  return nil
end

local match_against_pascal_error_formats = function(line, current_file)
  local error_formats = {
    {
      pattern = "(.+)[(](%d+),(%d+)[)](.+)",
      extract = function(results)
        return {
          filename = current_file,
          lnum = results[2],
          col = results[3],
          text = results[4],
        }
      end,
    },
    {
      pattern = "(.+)[(](%d+)[)](.+)",
      extract = function(results)
        return {
          filename = current_file,
          lnum = results[2],
          text = results[3],
        }
      end,
    },
  }

  for _, error_format in ipairs(error_formats) do
    local results = { string.match(line, error_format.pattern) }
    if vim.tbl_count(results) > 0 then
      return error_format.extract(results)
    end
  end

  return nil
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.pas",
  group = vim.api.nvim_create_augroup("PascalCompile", { clear = true }),
  callback = function(args)
    -- Get filepath relative to current root directory
    local relative_filepath = vim.fn.fnamemodify(args.file, ":~:.")
    vim.fn.jobstart({ "fpc", relative_filepath }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          local qf_entries = {}
          local current_file = relative_filepath

          for _, line in ipairs(data) do
            local file = match_against_compile_file_format(line)
            if file then
              current_file = file
            else
              local entry = match_against_pascal_error_formats(line, current_file)
              if entry then
                table.insert(qf_entries, entry)
              end
            end
          end

          vim.fn.setqflist(qf_entries, "r")

          if vim.tbl_count(qf_entries) > 0 then
            local cur_win = vim.api.nvim_get_current_win()
            vim.cmd.copen()
            vim.api.nvim_set_current_win(cur_win)
          else
            vim.cmd.cclose()
            print(string.format("%s compiled successfully.", relative_filepath))
          end
        end
      end,
    })
  end,
})
