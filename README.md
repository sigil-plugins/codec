# codec

`codec` is the deliberately small, capability-free reference plugin for
Sigil's public GitHub distribution path. It exports one pure function:

```lua
local codec = require("wasm.codec")
expect(codec["echo-u32"](42) == 42)
```

The repository contains the complete WIT and core-WAT source. The component
build is pinned to `wasm-tools 1.252.0`; CI validates it with Sigil 0.31.0 and
the release workflow publishes only the canonical package plus `SHA256SUMS`.

```bash
just check
just dist
sigil plugin install codec@1.0.0
sigil run examples/visible.lua
```

Installation records a bootstrap digest acquisition, not a signature, grant,
or project lock. P3 supports this plugin for visible local authoring only;
evaluation remains fail-closed until P4 supplies an exact checked-in lock.
