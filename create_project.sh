# 创建一个创建项目的脚本
#!/bin/bash

# 创建项目根目录
mkdir -p AgentDSDemo
cd AgentDSDemo

# 创建基础文件
touch README.md .env.example .gitignore requirements.txt pyproject.toml LICENSE

# 创建配置文件目录
mkdir -p config
touch config/__init__.py config/settings.py config/prompts.py config/logging_config.py

# 创建源代码目录
mkdir -p src
touch src/__init__.py src/main.py

# 创建核心模块
mkdir -p src/core
touch src/core/__init__.py src/core/agent.py src/core/tool_agent.py src/core/memory.py src/core/knowledge_base.py

# 创建工具模块
mkdir -p src/tools
touch src/tools/__init__.py src/tools/base_tool.py src/tools/calculator.py src/tools/web_search.py src/tools/file_reader.py src/tools/weather.py

# 创建API模块
mkdir -p src/api
touch src/api/__init__.py src/api/server.py src/api/routes.py src/api/models.py src/api/middlewares.py

# 创建工具函数模块
mkdir -p src/utils
touch src/utils/__init__.py src/utils/helpers.py src/utils/validators.py src/utils/logger.py

# 创建存储模块
mkdir -p src/storage
touch src/storage/__init__.py src/storage/database.py src/storage/vector_store.py src/storage/cache.py

# 创建命令行界面
mkdir -p src/cli
touch src/cli/__init__.py src/cli/commands.py src/cli/interactive.py

# 创建测试目录
mkdir -p tests
touch tests/__init__.py tests/conftest.py tests/test_agent.py tests/test_tools.py tests/test_api.py tests/test_integration.py

# 创建示例目录
mkdir -p examples
touch examples/hello_world.py examples/tool_demo.py examples/api_client.py examples/web_demo.py examples/custom_agent.py

# 创建文档目录
mkdir -p docs
touch docs/index.md docs/quick_start.md docs/api_reference.md docs/development.md docs/deployment.md

# 创建脚本目录
mkdir -p scripts
touch scripts/setup_env.sh scripts/deploy.sh scripts/benchmark.py

# 创建数据目录
mkdir -p data/knowledge data/logs data/cache

# 创建Web目录（可选）
mkdir -p web/static web/templates
touch web/app.py

echo "项目结构创建完成！"


# 运行脚本
# chmod +x create_project.sh
# ./create_project.sh