#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "=== 批量压缩JPG图片 ==="
echo ""

# 设置参数
INPUT_DIR="./images"
OUTPUT_DIR="./images"
QUALITY=60
MAX_WIDTH=1000

# 检查ImageMagick是否安装
if ! command -v magick &> /dev/null; then
    echo "❌ 错误: ImageMagick 未安装"
    echo "请先安装: brew install imagemagick"
    echo "或访问: https://imagemagick.org"
    read -p "按回车键退出..."
    exit 1
fi

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 统计文件数
count=$(find "$INPUT_DIR" -name "*.jpg" 2>/dev/null | wc -l)
if [ $count -eq 0 ]; then
    echo "❌ 错误: 在 $INPUT_DIR 中没有找到JPG文件"
    echo "请确保 input 文件夹存在并包含JPG图片"
    read -p "按回车键退出..."
    exit 1
fi

echo "找到 $count 个JPG文件"
echo "开始处理..."

# 处理图片
i=0
find "$INPUT_DIR" -name "*.jpg" | while read file; do
    i=$((i+1))
    filename=$(basename "$file")
    echo "[$i/$count] 正在压缩: $filename"
    magick "$file" \
        -resize "${MAX_WIDTH}x" \
        -quality $QUALITY \
        -strip \
        -interlace Plane \
        "${OUTPUT_DIR}/${filename}"
done

echo ""
echo "✅ 批量压缩完成！"
echo "输出目录: $OUTPUT_DIR/"
echo ""
read -p "按回车键退出..."