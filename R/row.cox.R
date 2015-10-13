row.cox <-
function(Y,time.cens,strat=NULL)  # Y = expression matrix, time.cens is a matrix with survival
                                 #time in first column and event indicator in second column
{
    m<-dim(Y)[1]                                                                             
    fit.stat<-fit.pval<-cox.stat<-cox.pval<-rep(NA,m)
    surv.obj<-Surv(time.cens[,1],time.cens[,2])
    for (i in 1:m)
    {
       x<-Y[i,]
       if (is.null(strat)) cox.res<-try(coxph(surv.obj~x))
       else cox.res<-try(coxph(surv.obj~x+strata(strat)))
       if (!is.character(cox.res))
       {
          cox.summ<-summary(cox.res)
          cox.stat[i]<-cox.summ$coef[1]
          cox.pval[i]<-cox.summ$sctest[3]
          zph.res<-cox.zph(cox.res)
          fit.stat[i]<-zph.res$table[2]
          fit.pval[i]<-zph.res$table[3]
       }
    }
    cox.ebp<-grenander.ebp(cox.pval)
    fit.ebp<-grenander.ebp(fit.pval)
    res<-cbind.data.frame(cox.stat=cox.stat,cox.pval=cox.pval,cox.ebp=cox.ebp$ebp,
                          cox.fit.stat=fit.stat,cox.fit.pval=fit.pval,cox.fit.ebp=fit.ebp$ebp)
}

