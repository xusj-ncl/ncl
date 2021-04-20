begin
  ncdf = addfile("./SLP-PC1-jan-34yr.nc","r")    
  AOI = ncdf->AOI
  
   ; 9±íÊ¾9¸öµã»¬¶¯Æ½¾ù£¬±¾Àý¶ÔÓ¦×ÅÊÇ9ÄêµÄ»¬¶¯£»0±íÊ¾×îÇ°Óë×îºó4Äê½«ÉèÎªÈ±Ê¡
  
  ;;;;;;;;;plot;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
  wks = gsn_open_wks("X11","plot-xy-AOI")
  gsn_define_colormap(wks,"rainbow")  
         
  res           = True              
  res@gsnDraw   = False ; ÔÝ²»»­
  res@gsnFrame  = False ; ÔÝ²»·­Ò³
  
  res2 = res
  
  res@vpHeightF = 0.35  ; ¸Ä±äviewportµÄ´óÐ¡
  res@vpWidthF 	= 0.6   ; 

  res@trXMinF	  = 1979  ; Éè¶¨XÖá×ø±ê·¶Î§
  res@trXMaxF	  = 2012
  res@trYMaxF   = 3  ; Éè¶¨YÖá×ø±ê·¶Î§
  res@trYMinF   = -3 

  res@gsnYRefLine = 0          ; 设定参考值。
  res@gsnAboveYRefLineColor = "red"          ; 大于该参考值所用的颜色
  res@gsnBelowYRefLineColor = "blue"

  res@tiXAxisString	= "year"   ; Ìí¼ÓXÖáÃû³Æ   
  res@tiYAxisString	= "AOI"    ; Ìí¼ÓYÖáÃû³Æ 
  
  plot = gsn_csm_xy(wks,AOI&year,AOI,res)       
  
  res2@xyLineColor = "black"
  res2@xyLineThicknessF = 4. 
  plot_mean = gsn_csm_xy(wks,AOI&year,AOI_mean,res2)
  overlay(plot,plot_mean)
    
  draw(plot) 
  frame(wks)  
end
