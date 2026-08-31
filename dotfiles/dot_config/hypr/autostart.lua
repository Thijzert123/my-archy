hl.on("hyprland.start", function()
  -- Fix slow app launch
  hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")

  hl.exec_cmd("uwsm app -- hyprpaper")
  hl.exec_cmd("uwsm app -- walker --gapplication-service")
  hl.exec_cmd("uwsm app -- waybar")
end)
