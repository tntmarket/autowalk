using PyCall
using PyPlot
@pyimport matplotlib.animation as anim

function main()

   # First set up the figure, the axis, and the plot element we want to animate
   fig = figure()
   ax = plt.axes(xlim=(0, 2), ylim=(-2, 2))
   global line = ax[:plot]([], [], lw=2)[1]

   # initialization function: plot the background of each frame
   function init()
      global line
      line[:set_data]([], [])
      return (line,None)
   end

   # animation function.  This is called sequentially
   function animate(i)
      x = linspace(0, 2, 1000)
      y = √abs(sin(2 * pi * (x - 0.01 * i)))
      global line
      line[:set_data](x, y)
      return (line,None)
   end

   myanim = anim.FuncAnimation(
      fig, animate, init_func=init, frames=100, interval=20
   )

   #= myanim[:save]( =#
   #=    "sinplot.mp4", =#
   #=    extra_args=["-vcodec", "libx264", "-pix_fmt", "yuv420p"] =#
   #= ) =#

end
