using XYModelwithYao

n=10
time_stop=500
disYao =sim_model(;n,time_stop)
plot_static_line(disYao[:,1:n];save_name="examples/momentum_dis.png")
plot_line_model(disYao[:,1:n];save_name="examples/momentum_dis.mp4")
plot_line_model(disYao[:,n+1:2*n];save_name="examples/expectz_dis.mp4")

dis2 =twolevel_sim_model(;n,time_stop)
plot_line_model(dis2;save_name="examples/momentum_dis_two.mp4")

plot_2line_model(disYao[:,1:n],dis2;save_name="examples/Yaovstwo.mp4")