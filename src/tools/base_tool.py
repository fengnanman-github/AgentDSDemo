# src/tools/base_tool.py
from abc import ABC, abstractmethod
from typing import Any, Dict, Optional
from pydantic import BaseModel, Field

class ToolParameter(BaseModel):
    """工具参数模型"""
    name: str = Field(..., description="参数名称")
    type: str = Field(..., description="参数类型")
    description: str = Field(..., description="参数描述")
    required: bool = Field(default=True, description="是否必需")

class ToolSchema(BaseModel):
    """工具模式定义"""
    name: str = Field(..., description="工具名称")
    description: str = Field(..., description="工具描述")
    parameters: Dict[str, ToolParameter] = Field(default_factory=dict, description="参数定义")

class BaseTool(ABC):
    """工具基类"""
    
    def __init__(self, name: str, description: str):
        self.name = name
        self.description = description
        self.parameters = self._define_parameters()
    
    @abstractmethod
    def _define_parameters(self) -> Dict[str, ToolParameter]:
        """定义工具参数"""
        pass
    
    @abstractmethod
    async def execute(self, **kwargs) -> Any:
        """执行工具"""
        pass
    
    def get_schema(self) -> Dict:
        """获取工具模式"""
        return {
            "type": "function",
            "function": {
                "name": self.name,
                "description": self.description,
                "parameters": {
                    "type": "object",
                    "properties": {
                        name: {
                            "type": param.type,
                            "description": param.description
                        }
                        for name, param in self.parameters.items()
                    },
                    "required": [
                        name for name, param in self.parameters.items() 
                        if param.required
                    ]
                }
            }
        }