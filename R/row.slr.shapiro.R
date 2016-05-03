row.slr.shapiro <-
function(Y,x)
{
  resids<-row.slr.resids(Y,x)
  t.shap.res<-apply(resids,1,shapiro.test2)
  shap.res<-t(t.shap.res)
  shap.ebp<-grenander.ebp(shap.res[,2])
  res<-cbind.data.frame(stat=shap.res[,1],
                        pval=shap.res[,2],
                        ebp=shap.ebp$ebp)
  return(res)
}

