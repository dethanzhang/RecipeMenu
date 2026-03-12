# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Astro-based static menu website (私房菜单 - Private Kitchen Menu) that uses Markdown files to manage dishes and recipes. It's designed for easy content management via GitHub web interface or local editing.

## Common Commands

```bash
# Install dependencies
npm install

# Start development server (http://localhost:4321)
npm run dev

# Build for production (outputs to dist/)
npm run build

# Preview production build locally
npm run preview
```

## Architecture

### Content Management
- **Content source**: `src/content/dishes/*.md` - Markdown files with YAML frontmatter
- **Content schema**: Defined in `src/content.config.ts` using Astro's content collections with Zod validation
- **Images**: Stored in `public/images/`, referenced in frontmatter as `/images/filename.jpg`
- **Template**: `src/content/dishes/_template.md` - Copy this when adding new dishes

### Required Frontmatter Schema
```yaml
---
name: string        # Dish name (required)
price: number       # Price in Yuan (required)
category: string    # e.g., "热菜", "汤品", "凉菜" (required)
tags: string[]      # Optional tags for filtering
time: string        # Optional cooking time (e.g., "30分钟")
difficulty: enum    # Optional: "简单" | "中等" | "困难"
image: string       # Optional path like /images/dish.jpg
ingredients: string[] # Optional list with quantities
---
```

### Routing
- **Homepage**: `src/pages/index.astro` - Displays all dishes grouped by category with tag filtering
- **Dish detail**: `src/pages/dish/[slug].astro` - Dynamic route for individual dish pages using `getStaticPaths()`
- **Slug generation**: Based on the Markdown filename (e.g., `hongshaorou.md` → `/dish/hongshaorou`)

### Key Components
- `DishCard.astro`: Card component used on homepage grid, displays image, name, price, tags
- `Layout.astro`: Base layout with global CSS variables and Google Fonts (Noto Sans SC)

### Client-Side Interactivity
- Tag filtering is implemented with vanilla JavaScript in `index.astro` (lines 54-85)
- Uses dataset attributes for filter state management
- No React/Vue/Svelte - pure Astro with minimal JS

### Styling
- CSS custom properties defined in `Layout.astro` `:root`
- Primary color scheme: orange-based (`#e65100`)
- Responsive breakpoints: 640px (mobile), 768px (tablet)
- Uses `is:global` for shared styles

## Adding New Dishes

1. Copy `src/content/dishes/_template.md` to new file
2. Name format: `pinyin-name.md` (e.g., `hongshaorou.md`) or use Chinese characters
3. Fill in frontmatter and Markdown content
4. Add image to `public/images/` if available
5. Build will automatically generate new pages

## Deployment

- **Platform**: Configured for Vercel (has `.vercel/` directory)
- **Output**: Static (`output: 'static'` in `astro.config.mjs`)
- **Node requirement**: >=22.12.0 (see `package.json` engines)

## Important Notes

- Files starting with `_` (like `_template.md`) are excluded from the collection via `!id.startsWith('_')` filter
- Images use `onerror` handler to fallback to placeholder if loading fails
- The site uses Chinese as the primary language (`lang="zh-CN"`)
