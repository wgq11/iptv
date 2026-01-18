#!/bin/bash

# 自动上传脚本
echo "开始自动上传到GitHub..."

# 用于检测本地文件更改并定时推送至GitHub

# 配置变量
REPO_PATH="/vol1/1000/docker/iptv-api/output"
BRANCH_NAME="main"
COMMIT_MESSAGE="Auto commit $(date '+%Y-%m-%d %H:%M:%S')"

# 进入仓库目录
cd "$REPO_PATH" || exit 1

# 添加所有更改
git add .

# 检查是否有更改需要提交
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
    exit 0
fi

# 提交更改
git commit -m "$COMMIT_MESSAGE"

# 推送到GitHub
git push origin "$BRANCH_NAME"

echo "上传完成！"