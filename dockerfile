# 1. 基础镜像

# ----------------------------------------------------

FROM python:3.10-slim

# ----------------------------------------------------

# 2. 系统依赖

# ----------------------------------------------------

RUN apt-get update                 \
&& apt-get install -y git curl    \
&& rm -rf /var/lib/apt/lists/*

# ----------------------------------------------------

# 3. 安装 uv / uvx

# ----------------------------------------------------

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# （可选）软链到 /usr/local/bin，方便手动调试

RUN ln -s /root/.local/bin/uvx /usr/local/bin/uvx

# ----------------------------------------------------


COPY . .


# 6. **容器启动命令** —— 直接跑 server
CMD ["/root/.local/bin/python", "-u", "-m", "minimax_mcp.server", \
     "--host", "0.0.0.0", "--port", "8080"]

