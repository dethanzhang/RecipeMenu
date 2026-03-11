# 🍜 私房菜单

一个基于 Astro 的静态菜单网站，使用 Markdown 管理菜品和食谱。

## 特性

- 📱 **多端适配** - 手机、平板、电脑都能完美浏览
- ✍️ **Markdown 管理** - 用 Markdown 文件添加菜品，比 JSON 更友好
- 🏷️ **标签筛选** - 点击标签快速筛选菜品
- ⚡ **极速加载** - 静态生成，无需服务器
- 🆓 **免费托管** - 可部署到 Vercel/Cloudflare Pages

## 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 构建
npm run build
```

## 如何添加菜品

### 方法 1：GitHub 网页编辑（推荐）

1. 打开 `src/content/dishes/` 目录
2. 点击 **Add file** → **Create new file**
3. 文件名格式：`菜名拼音.md`（如 `hongshaorou.md`）
4. 复制下面模板，填写内容
5. 点击 **Commit changes** 保存

### 方法 2：本地编辑

1. 复制 `src/content/dishes/_template.md` 模板
2. 修改文件名和内容
3. `git add . && git commit -m "添加新菜品" && git push`
4. Vercel 会自动重新部署

## 菜品模板

```markdown
---
name: 菜名
price: 价格（数字）
category: 分类
tags: [标签1, 标签2]
time: 烹饪时间
difficulty: 简单/中等/困难
image: /images/图片名.jpg
ingredients:
  - 食材1 用量
  - 食材2 用量
---

## 烹饪步骤

1. **步骤一**：详细说明
2. **步骤二**：详细说明

## 小贴士

- 提示内容
```

## 字段说明

| 字段 | 必填 | 说明 |
|------|------|------|
| `name` | ✅ | 菜品名称 |
| `price` | ✅ | 价格，只写数字 |
| `category` | ✅ | 分类，如"热菜"、"汤品"、"凉菜" |
| `tags` | 可选 | 标签数组，如 `["热门", "辣"]` |
| `time` | 可选 | 烹饪时间，如 "30分钟" |
| `difficulty` | 可选 | 难度：简单/中等/困难 |
| `image` | 可选 | 图片路径，放 `public/images/` 下 |
| `ingredients` | 可选 | 食材清单数组 |

## 添加图片

1. 上传图片到 `public/images/` 目录
2. 在 frontmatter 中填写图片路径，如 `/images/hongshaorou.jpg`
3. 支持 jpg/png/webp 格式

## 部署到 Vercel

1. 在 Vercel 导入 GitHub 仓库
2. 框架预设选 **Astro**
3. 点击 Deploy
4. 在 Settings → Domains 绑定你的域名

## 项目结构

```
├── src/
│   ├── content/
│   │   ├── dishes/          # 菜品 Markdown 文件
│   │   │   ├── hongshaorou.md
│   │   │   └── ...
│   │   └── _template.md     # 新增菜品模板
│   ├── layouts/
│   │   └── Layout.astro     # 页面布局
│   ├── components/
│   │   └── DishCard.astro   # 菜品卡片组件
│   └── pages/
│       ├── index.astro      # 菜单首页
│       └── dish/
│           └── [slug].astro  # 菜品详情页
├── public/
│   └── images/              # 菜品图片
└── astro.config.mjs         # 配置文件
```
