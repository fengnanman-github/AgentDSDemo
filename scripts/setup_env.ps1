#!/bin/bash
# scripts/setup_env.sh

echo "设置 AgentDSDemo 开发环境..."

# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate  # Windows

# 安装依赖
pip install --upgrade pip
pip install -e ".[dev]"  # 安装开发依赖

# 设置环境变量
if [ ! -f .env ]; then
    cp .env.example .env
    echo "请编辑 .env 文件，添加您的 DeepSeek API 密钥"
fi

echo "环境设置完成！"
echo "激活虚拟环境: source venv/bin/activate"
echo "运行示例: python -m src.main hello"