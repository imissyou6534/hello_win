# 需要下载mingw64和make，添加到系统变量

# 编译器设置
CXX      := g++
CXXFLAGS := -Iinclude -Wall -Wextra -std=c++11
LDFLAGS  := 
EXEC     := bin/app.exe

# 文件路径设置
SRC_DIR  := src
BUILD_DIR:= build
BIN_DIR  := bin
INC_DIR  := include

# 自动获取源文件列表
SRCS     := $(wildcard $(SRC_DIR)/*.cpp)
OBJS     := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# 默认目标
all: $(BUILD_DIR) $(BIN_DIR) $(EXEC)

# 创建必要目录
$(BUILD_DIR) $(BIN_DIR):
	@mkdir -p $@

# 可执行文件链接
$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# 模式规则：编译源文件
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 运行程序
run: $(EXEC)
	@echo "----- running -----"
	@$(EXEC)

# 清理构建产物
clean:
	@del /q $(BUILD_DIR)\* 2>nul || exit 0
	@del /q $(BIN_DIR)\* 2>nul || exit 0

.PHONY: all clean run