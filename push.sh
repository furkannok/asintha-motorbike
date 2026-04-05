#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# asintha-motorbike — Push all files to GitHub
# Run this ONCE inside your local clone of https://github.com/furkannok/asintha-motorbike
# ─────────────────────────────────────────────────────────────────────────────

set -e

# 1. Unzip the downloaded archive into a temp folder
TMPDIR=$(mktemp -d)
echo "→ Extracting files to $TMPDIR …"
unzip -q "asintha-motorbike-push.zip" -d "$TMPDIR"

# 2. Copy everything into the current repo (where you ran this script)
echo "→ Copying files into repo …"
cp -r "$TMPDIR"/. .

# 3. Stage, commit, push
echo "→ Staging all files …"
git add -A

echo "→ Committing …"
git commit -m "feat: initial build — Asintha Rent Motorbike website

- Astro + pnpm setup for GitHub Pages
- Full homepage: Hero, TrustBar, BikesGrid, Process,
  Prices & Terms, ServiceArea, FAQ, Contact, Footer
- SectionDivider SVG wave component
- Dark adventure design (Barlow Condensed + Inter)
- Orange #FF6B00 accent, sticky WhatsApp float button
- Scroll-reveal observer, mobile hamburger nav
- GitHub Actions deploy workflow (pnpm/action-setup@v4)"

echo "→ Pushing to origin/main …"
git push origin main

echo ""
echo "✓ Done! Open: https://github.com/furkannok/asintha-motorbike"
echo "  GitHub Pages will be live at:"
echo "  https://furkannok.github.io/asintha-motorbike/"
echo ""
echo "  IMPORTANT: Make sure GitHub Pages is set to:"
echo "  Settings → Pages → Source: GitHub Actions"

rm -rf "$TMPDIR"
