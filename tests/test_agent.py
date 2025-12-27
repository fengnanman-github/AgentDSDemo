# tests/test_agent.py
import pytest
from unittest.mock import Mock, patch
from src.core.agent import DeepSeekAgent
from config.settings import settings

class TestDeepSeekAgent:
    """测试DeepSeek智能体"""
    
    @pytest.fixture
    def agent(self):
        """创建智能体实例"""
        return DeepSeekAgent()
    
    def test_agent_initialization(self, agent):
        """测试智能体初始化"""
        assert agent.client is not None
        assert isinstance(agent.conversation_history, list)
        assert len(agent.conversation_history) == 0
    
    @patch('src.core.agent.OpenAI')
    def test_get_response(self, mock_openai, agent):
        """测试获取回复"""
        # 模拟API响应
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = "测试回复"
        
        mock_client = Mock()
        mock_client.chat.completions.create.return_value = mock_response
        agent.client = mock_client
        
        response = agent.get_response("测试消息")
        
        assert response == "测试回复"
        assert len(agent.conversation_history) == 2
    
    def test_clear_history(self, agent):
        """测试清空历史"""
        agent.conversation_history = [
            {"role": "user", "content": "测试"},
            {"role": "assistant", "content": "回复"}
        ]
        
        agent.clear_history()
        
        assert len(agent.conversation_history) == 0