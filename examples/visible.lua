return {
  title = "Pure codec round trip",
  priority = "P2",
  policy = { capabilities = { "wasm.codec" } },
  run = function()
    local codec = require("wasm.codec")
    expect(codec["echo-u32"](42) == 42)
  end,
}

