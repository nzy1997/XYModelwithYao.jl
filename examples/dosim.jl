using XYModelwithYao

n=10
k=3
time_stop=500

for Ω in [0.1,0.2,0.3,0.4, 0.5]
    disYao =sim_model(;n,k,time_stop,Ω)
    plot_static_line(disYao[:,1:n];save_name="examples/momentum_dis_omega$Ω.png")
    plot_line_model(disYao[:,1:n];save_name="examples/momentum_dis_omega$Ω.mp4")
    plot_line_model(disYao[:,n+1:2*n];save_name="examples/expectz_dis_omega$Ω.mp4")

    dis2 =twolevel_sim_model(;n,k,time_stop,Ω)
    plot_static_line(dis2;save_name="examples/momentum_dis_two_omega$Ω.png")
    plot_line_model(dis2;save_name="examples/momentum_dis_two_omega$Ω.mp4")

    plot_2line_model(disYao[:,1:n],dis2;save_name="examples/Yaovstwo_omega$Ω.mp4")
end