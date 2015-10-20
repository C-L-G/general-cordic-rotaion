# general-cordic-rotaion

通用Cordic旋转模块

对加菲的书《IP核心志》 231页的图进行实现。（当然我还对一些细节进行优化，以满足我的FPGA设计思路）

目前只是demo ，可以实现角度转 X Y的计算，其他的还没测试，可能在顺时针逆时针控制方面需要优化完善。

工程附带 angle to XY的 tb

top层为general_cordic_rotation

核心代码为 rotation.v 

详细的实现思路，我会在blog是贴出。当然是我有时间的话。有什么问题大家可以Q我


have fun

--@--Young--@--


