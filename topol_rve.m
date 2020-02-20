function[ arith ]=topol_rve(h1,h2,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka)


if h3==1
    arith=h1+(h2-1)*(hexa1+1)+kuvos;
else
    if h3==hexa3+1
        arith=hexa3*(hexa1+1)*(hexa2+1)+h1+(h2-1)*(hexa1+1);
    else
        if h2==1
            arith=(h3-2)*endiam_plaka+kuvos+katw_plaka+h1;
        else
            if h2==hexa2+1
                arith=(h3-2)*endiam_plaka+kuvos+katw_plaka+(hexa1+1)+2*(hexa2-1)+h1;
            else
                if h1==1
                    arith=kuvos+katw_plaka+(h3-2)*endiam_plaka+(hexa1+1)+(h2-2)*2+1;
                else
                    if h1==hexa1+1
                        arith=kuvos+katw_plaka+(h3-2)*endiam_plaka+(hexa1+1)+(h2-2)*2+2;
                    else
                        arith=(h1-1)+(h2-2)*(hexa1-1)+(h3-2)*(hexa1-1)*(hexa2-1);
                    end
                end
            end
        end
    end
end
            

end