# codec

`codec` is the deliberately small, capability-free reference plugin for
Sigil's public GitHub distribution path. It exports one pure function:

```lua
local codec = require("wasm.codec")
expect(codec["echo-u32"](42) == 42)
```

The repository contains the complete WIT and core-WAT source. The component
build is pinned to `wasm-tools 1.252.0`; CI uses a pinned zstd 1.5.7
compatibility packer that emits the same package and canonical release manifest
as Sigil. The protected, manually dispatched publisher accepts only exact
approved candidate digests, creates one GitHub OIDC/Sigstore attestation for
the package, and publishes the package, `SHA256SUMS`, and
`release-manifest.json` as an immutable release. It never uses a signing key.

```bash
just check
just dist
just sigil-check
sigil plugin install codec@1.1.2
sigil run examples/visible.lua
```

Version 1.1.2 is the first accepted keyless-provenance release. Sigil verifies
and pins its exact repository, workflow, source commit, protected environment,
package, manifest, and public transparency proof before installation or
evaluation.
Version 1.1.1 was published while GitHub release immutability was disabled and
is permanently burned and emergency-denied; its tag and assets are preserved,
never replaced or deleted. Earlier releases remain historical bootstrap-digest
evidence and are never promoted in place.
