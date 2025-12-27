# src/main.py
import argparse
import asyncio
from typing import Optional
from src.core.agent import DeepSeekAgent
from src.core.tool_agent import ToolAgent
from src.api.server import app
import uvicorn
from config.settings import settings

def run_hello_world():
    """运行Hello World示例"""
    print(f"=== {settings.APP_NAME} v{settings.APP_VERSION} ===")
    print("运行Hello World示例...")
    
    agent = DeepSeekAgent()
    response = agent.get_response("你好，请用中文说'Hello World'")
    print(f"智能体: {response}")
    
    response = agent.get_response("介绍一下你自己")
    print(f"智能体: {response}")

async def run_interactive():
    """运行交互式对话"""
    print(f"=== {settings.APP_NAME} v{settings.APP_VERSION} ===")
    print("输入 'quit' 或 'exit' 退出")
    print("-" * 50)
    
    agent = ToolAgent()
    
    while True:
        try:
            user_input = input("\n你: ").strip()
            
            if user_input.lower() in ['quit', 'exit', 'q']:
                print("再见！")
                break
                
            if not user_input:
                continue
                
            response = await agent.get_response_async(user_input)
            print(f"\n智能体: {response}")
            
        except KeyboardInterrupt:
            print("\n\n程序被中断")
            break
        except Exception as e:
            print(f"\n错误: {e}")

def run_api_server():
    """运行API服务器"""
    print(f"启动API服务器: http://{settings.HOST}:{settings.PORT}")
    print(f"API文档: http://{settings.HOST}:{settings.PORT}/docs")
    
    uvicorn.run(
        app,
        host=settings.HOST,
        port=settings.PORT,
        log_level="info" if settings.DEBUG else "warning"
    )

def main():
    """主函数"""
    parser = argparse.ArgumentParser(
        description=f"{settings.APP_NAME} - 基于DeepSeek的智能体演示"
    )
    
    parser.add_argument(
        "mode",
        choices=["hello", "interactive", "api", "demo"],
        default="hello",
        nargs="?",
        help="运行模式: hello(Hello World), interactive(交互式), api(API服务器), demo(演示)"
    )
    
    parser.add_argument(
        "--host",
        default=settings.HOST,
        help=f"API服务器主机 (默认: {settings.HOST})"
    )
    
    parser.add_argument(
        "--port",
        type=int,
        default=settings.PORT,
        help=f"API服务器端口 (默认: {settings.PORT})"
    )
    
    args = parser.parse_args()
    
    if args.mode == "hello":
        run_hello_world()
    elif args.mode == "interactive":
        asyncio.run(run_interactive())
    elif args.mode == "api":
        settings.HOST = args.host
        settings.PORT = args.port
        run_api_server()
    elif args.mode == "demo":
        from examples.tool_demo import main as run_demo
        run_demo()
    else:
        parser.print_help()

if __name__ == "__main__":
    main()