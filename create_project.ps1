# 保存为 create_project.ps1
# 右键点击 PowerShell 脚本文件 -> 使用 PowerShell 运行

# 创建项目根目录
New-Item -ItemType Directory -Path "AgentDSDemo" -Force
Set-Location "AgentDSDemo"

# 创建基础文件
New-Item -ItemType File -Path "README.md" -Force
New-Item -ItemType File -Path ".env.example" -Force
New-Item -ItemType File -Path ".gitignore" -Force
New-Item -ItemType File -Path "requirements.txt" -Force
New-Item -ItemType File -Path "pyproject.toml" -Force
New-Item -ItemType File -Path "LICENSE" -Force

# 创建配置文件目录
New-Item -ItemType Directory -Path "config" -Force
New-Item -ItemType File -Path "config\__init__.py" -Force
New-Item -ItemType File -Path "config\settings.py" -Force
New-Item -ItemType File -Path "config\prompts.py" -Force
New-Item -ItemType File -Path "config\logging_config.py" -Force

# 创建源代码目录
New-Item -ItemType Directory -Path "src" -Force
New-Item -ItemType File -Path "src\__init__.py" -Force
New-Item -ItemType File -Path "src\main.py" -Force

# 创建核心模块
New-Item -ItemType Directory -Path "src\core" -Force
New-Item -ItemType File -Path "src\core\__init__.py" -Force
New-Item -ItemType File -Path "src\core\agent.py" -Force
New-Item -ItemType File -Path "src\core\tool_agent.py" -Force
New-Item -ItemType File -Path "src\core\memory.py" -Force
New-Item -ItemType File -Path "src\core\knowledge_base.py" -Force

# 创建工具模块
New-Item -ItemType Directory -Path "src\tools" -Force
New-Item -ItemType File -Path "src\tools\__init__.py" -Force
New-Item -ItemType File -Path "src\tools\base_tool.py" -Force
New-Item -ItemType File -Path "src\tools\calculator.py" -Force
New-Item -ItemType File -Path "src\tools\web_search.py" -Force
New-Item -ItemType File -Path "src\tools\file_reader.py" -Force
New-Item -ItemType File -Path "src\tools\weather.py" -Force

# 创建API模块
New-Item -ItemType Directory -Path "src\api" -Force
New-Item -ItemType File -Path "src\api\__init__.py" -Force
New-Item -ItemType File -Path "src\api\server.py" -Force
New-Item -ItemType File -Path "src\api\routes.py" -Force
New-Item -ItemType File -Path "src\api\models.py" -Force
New-Item -ItemType File -Path "src\api\middlewares.py" -Force

# 创建工具函数模块
New-Item -ItemType Directory -Path "src\utils" -Force
New-Item -ItemType File -Path "src\utils\__init__.py" -Force
New-Item -ItemType File -Path "src\utils\helpers.py" -Force
New-Item -ItemType File -Path "src\utils\validators.py" -Force
New-Item -ItemType File -Path "src\utils\logger.py" -Force

# 创建存储模块
New-Item -ItemType Directory -Path "src\storage" -Force
New-Item -ItemType File -Path "src\storage\__init__.py" -Force
New-Item -ItemType File -Path "src\storage\database.py" -Force
New-Item -ItemType File -Path "src\storage\vector_store.py" -Force
New-Item -ItemType File -Path "src\storage\cache.py" -Force

# 创建命令行界面
New-Item -ItemType Directory -Path "src\cli" -Force
New-Item -ItemType File -Path "src\cli\__init__.py" -Force
New-Item -ItemType File -Path "src\cli\commands.py" -Force
New-Item -ItemType File -Path "src\cli\interactive.py" -Force

# 创建测试目录
New-Item -ItemType Directory -Path "tests" -Force
New-Item -ItemType File -Path "tests\__init__.py" -Force
New-Item -ItemType File -Path "tests\conftest.py" -Force
New-Item -ItemType File -Path "tests\test_agent.py" -Force
New-Item -ItemType File -Path "tests\test_tools.py" -Force
New-Item -ItemType File -Path "tests\test_api.py" -Force
New-Item -ItemType File -Path "tests\test_integration.py" -Force

# 创建示例目录
New-Item -ItemType Directory -Path "examples" -Force
New-Item -ItemType File -Path "examples\hello_world.py" -Force
New-Item -ItemType File -Path "examples\tool_demo.py" -Force
New-Item -ItemType File -Path "examples\api_client.py" -Force
New-Item -ItemType File -Path "examples\web_demo.py" -Force
New-Item -ItemType File -Path "examples\custom_agent.py" -Force

# 创建文档目录
New-Item -ItemType Directory -Path "docs" -Force
New-Item -ItemType File -Path "docs\index.md" -Force
New-Item -ItemType File -Path "docs\quick_start.md" -Force
New-Item -ItemType File -Path "docs\api_reference.md" -Force
New-Item -ItemType File -Path "docs\development.md" -Force
New-Item -ItemType File -Path "docs\deployment.md" -Force

# 创建脚本目录
New-Item -ItemType Directory -Path "scripts" -Force
New-Item -ItemType File -Path "scripts\setup_env.ps1" -Force
New-Item -ItemType File -Path "scripts\deploy.ps1" -Force
New-Item -ItemType File -Path "scripts\benchmark.py" -Force

# 创建数据目录
New-Item -ItemType Directory -Path "data\knowledge" -Force
New-Item -ItemType Directory -Path "data\logs" -Force
New-Item -ItemType Directory -Path "data\cache" -Force

# 创建Web目录（可选）
New-Item -ItemType Directory -Path "web\static" -Force
New-Item -ItemType Directory -Path "web\templates" -Force
New-Item -ItemType File -Path "web\app.py" -Force

Write-Host "项目结构创建完成！" -ForegroundColor Green