% PLOT
 SAMPLES = SAMPLES_SEQ_BASIC;
 num_gest=size(SAMPLES, 1);
 num_usr=size(SAMPLES, 2);
 g= 8 % <<- gesto a plotear
 sameplot=0;  % Plotear las muestras en el mismo plot o por usuario
 figure( 'Name', 'Feature');
 
 for u=1 :num_usr
 %for u=1 :3
        no_samples=size(SAMPLES{g, u}, 2);
        if sameplot==0
             ColorSet = varycolor(no_samples); % Program to generate color matrix http://blogs.mathworks.com/pick/2008/08/15/colors-for-your-multi-line-plots/
             figure( 'Name', 'Trajectory');
        else
             ColorSet = varycolor(num_usr*10); % Program to generate color matrix http://blogs.mathworks.com/pick/2008/08/15/colors-for-your-multi-line-plots/

        end
        for s=1:no_samples
              sample = SAMPLES{g, u}{1, s};
              
              if sameplot==0
                  plot(sample(1, :), sample(2, :));
               else
                  plot([1:size(sample,2)], sample(feature, :),'color', ColorSet(u*10, :));
              end
              
                
              hold all;
        end
                          
 end
hold off


