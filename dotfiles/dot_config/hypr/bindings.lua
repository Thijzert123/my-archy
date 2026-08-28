-- Split monitor workspaces
package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")
smw.setup({
  workspace_count = 10,
})
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    local code = tostring(i + 9) -- Use code:10 value instead of number 1 (otherwise it doens't work idk)
    if n == "10" then n = "0" end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    -- Switch to the Nth workspace on the currently focused monitor.
    hl.bind("SUPER + code:" .. code, smw.workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor
    hl.bind("SUPER + SHIFT + code:" .. code, smw.move_to_workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor silently
    hl.bind("SUPER + SHIFT + ALT + code:" .. code, smw.move_to_workspace_silent(n))
end

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + SHIFT + ALT + B", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("spotify"))

hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + Q", hl.dsp.window.close())

hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "d" }))

-- Toggle scratchpad
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"))
-- Move window to scratchpad
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
hl.bind("SUPER + grave", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind("SUPER + SHIFT + grave", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

hl.bind("SUPER + TAB", hl.dsp.focus({ monitor = "+1" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.window.move({ monitor = "+1" }))
hl.bind("SUPER + SHIFT + ALT + TAB", hl.dsp.window.move({ monitor = "+1", follow = false }))

hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }))
hl.bind("ALT + TAB", hl.dsp.window.bring_to_top())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.bring_to_top())

-- Shrink windows up/down/left/right
hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind("SUPER + ALT + code:20", hl.dsp.window.resize({ x = -25, y = 0, relative = true }))
hl.bind("SUPER + ALT + code:21", hl.dsp.window.resize({ x = 25, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -25, relative = true }))
hl.bind("SUPER + SHIFT + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 25, relative = true }))

hl.bind("SUPER + CTRL + code:20", hl.dsp.window.resize({ x = -300, y = 0, relative = true }))
hl.bind("SUPER + CTRL + code:21", hl.dsp.window.resize({ x = 300, y = 0, relative = true }))
hl.bind("SUPER + CTRL + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -300, relative = true }))
hl.bind("SUPER + CTRL + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 300, relative = true }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Toggle grouping
hl.bind("SUPER + G", hl.dsp.group.toggle())
-- Move active window out of group
hl.bind("SUPER + ALT + G", hl.dsp.window.move({ out_of_group = true }))

-- Move window to group in left/right/top/bottom
hl.bind("SUPER + ALT + LEFT", hl.dsp.window.move({ into_group = "l" }))
hl.bind("SUPER + ALT + RIGHT", hl.dsp.window.move({ into_group = "r" }))
hl.bind("SUPER + ALT + UP", hl.dsp.window.move({ into_group = "u" }))
hl.bind("SUPER + ALT + DOWN", hl.dsp.window.move({ into_group = "d" }))

-- Next/previous window in group
hl.bind("SUPER + ALT + TAB", hl.dsp.group.next())
hl.bind("SUPER + ALT + SHIFT + TAB", hl.dsp.group.prev())

-- Move grouped window focus left/right
hl.bind("SUPER + CTRL + LEFT", hl.dsp.group.prev())
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.group.next())

-- Next/previous window in group
hl.bind("SUPER + ALT + mouse_down", hl.dsp.group.next())
hl.bind("SUPER + ALT + mouse_up", hl.dsp.group.prev())

-- Switch to group window _index_
for index = 1, 5 do
  hl.bind("SUPER + ALT + code:" .. tostring(index + 9), hl.dsp.group.active({ index = index }))
end
