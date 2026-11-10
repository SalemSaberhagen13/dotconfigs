---@meta

---@class Window
---@class Workspace
---@class Monitor
---@class LayerSurface
---@class Timer

---@class Hyprland
---@field bind fun(keys: string, dispatcher: string|function, description?: string)
---@field on fun(event: string, callback: function)
---@field config fun(opts: table)
---@field get_config fun(option: string): any
---@field get_active_window fun(): Window?
---@field get_windows fun(): Window[]
---@field get_window fun(selector: string): Window?
---@field get_urgent_window fun(): Window?
---@field get_workspaces fun(): Workspace[]
---@field get_workspace fun(selector: string): Workspace?
---@field get_active_workspace fun(): Workspace
---@field get_monitors fun(): Monitor[]
---@field get_monitor fun(selector: string): Monitor?
---@field get_active_monitor fun(): Monitor
---@field get_monitor_at fun(pos: {x: number, y: number}): Monitor?
---@field get_monitor_at_cursor fun(): Monitor
---@field get_cursor_pos fun(): {x: number, y: number}
---@field get_last_window fun(): Window?
---@field get_last_workspace fun(): Workspace?
---@field get_layers fun(): LayerSurface[]
---@field get_workspace_windows fun(selector: string): Window[]
---@field get_current_submap fun(): string
---@field version fun(): string
---@field exec_cmd fun(cmd: string, opts?: table)
---@field get_loaded_plugins fun(): table
---@field timer fun(callback: function, opts?: {timeout: number, type?: string}): Timer
---@field dispatch fun(action: any)
---@field notification table
---@field dsp table

hl = {}
