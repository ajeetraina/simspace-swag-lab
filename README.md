# 🐳 Swag Lab — Simspace

A hands-on workshop for **[fake-docker-swags](https://github.com/ajeetraina/fake-docker-swags)**:
an autonomous A/B testing agent that shops a live store, fixes what's broken,
proves it, and ships a PR — all inside **Docker Sandboxes**, where a planted
prompt-injection trap proves it can't leak your secrets.

Two cards:

| Card | Kind | Time | What it is |
|------|------|------|------------|
| **Swag Lab — Slides** | slides | ~25 min | The talk: where the LLM, MCP, Kits, and Policies each do real work, and the security payoff. |
| **Swag Lab — Hands-on** | lab | ~45 min | Drive the whole loop in a simulated terminal: simulate → analyze → variant → cloud score → trap blocked → PR. |

The hands-on lab runs entirely in the browser via `simulator.yaml` — no real
`sbx` or cloud account needed. The real tooling lives in the
[fake-docker-swags](https://github.com/ajeetraina/fake-docker-swags) repo.

- **Live store (the test subject):** https://fakestore.dockerworkshop.com

## Run it locally

```bash
docker compose up dev            # http://localhost:5173
```

Or as a self-contained container:

```bash
docker build -t swag-lab .
docker run --rm -p 8080:80 swag-lab   # http://localhost:8080
```

## Validate

```bash
docker compose run --rm validate  # lints both labs; nonzero exit on errors
```

## Hosting

Pushed to `main`, the **Deploy lab to GitHub Pages** workflow publishes this
simspace to GitHub Pages (enable once: Settings → Pages → Source: *GitHub
Actions*).

## Layout

```
lab/
  swag-lab-slides/   kind: slides deck (+ assets/swag-lab-demo.gif)
  swag-lab/          hands-on lab: sections + simulator.yaml
compose.yaml         authoring env (dev preview + validate)
Dockerfile           self-contained runtime image
.github/workflows/   deploy (Pages) + validate (PR lint)
```

> `labs.json` is generated from each `labspace.yaml` at build time — never edit
> it by hand.
