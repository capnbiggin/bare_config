-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
  output   = "desc:LG Electronics LG ULTRAWIDE 0x000357A4",
  mode     = "2560x1080@59.98",
  position = "0x0",
  scale    = "1",
})

hl.monitor({
  output   = "eDP-2",
  mode     = "2560x1600@240.02",
  position = "0x1080",
  scale    = "1.6",
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

