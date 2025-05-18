#include "utils.h"

// random number
random_device rd;   // 用于获取随机种子
mt19937 gen(rd()); // 使用 Mersenne Twister 算法作为随机数引擎

int randint()
{
    return gen();
}
int randuint() // [a,b]
{
    uniform_int_distribution<> dis(0,numeric_limits<int>::max());
    return dis(gen);
}
