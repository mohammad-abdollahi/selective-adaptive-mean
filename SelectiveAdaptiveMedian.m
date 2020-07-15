function out = SelectiveAdaptiveMedian(img) 
[h, w] = size(img);
out = img;
for i = 1:h
    for j =1:w
        if img(i,j)==0 || img(i,j)==255
           k = 1;
           while(1)
              flt=[];
              if 2*k+1 > 15
                  break
              end
              for l = i-k:i+k
                  for m = j-k:j+k
                      if l < 1 || l > h || m < 1 || m > w
                        flt = [flt,0];
                      else
                        flt = [flt, out(l, m)];
                      end
                  end
              end
              med = median(flt);
              maximum = max(flt);
              minimum = min(flt);
              out(i,j)=med;
              if(minimum < med && med<maximum)
                  k = k+1;
              else 
                  break;
              end
           end
           
        else   
            out(i,j)=img(i, j);
        end    
    end
end
end