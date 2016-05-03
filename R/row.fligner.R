row.fligner <-
function(Y,grps)
{
   grps<-as.character(unlist(grps))
   ugrps<-sort(unique(grps))
   ngrps<-length(ugrps)
   m<-dim(Y)[1]
   Y1<-matrix(Y[,grps==ugrps[1]],m,sum(grps==ugrps[1]))
   Y2<-matrix(Y[,grps==ugrps[2]],m,sum(grps==ugrps[2]))
   P<-Y1
   Q<-Y2
   n1<-dim(Y1)[2]
   n2<-dim(Y2)[2]
   for (i in 1:n1)
   {
    Y.temp<-matrix(Y1[,i],m,n1)
    P[,i]<-rowSums(Y2<Y.temp)
   }
   for (i in 1:n2) 
   {
    Y.temp<-matrix(Y2[,i],m,n2)
    Q[,i]<-rowSums(Y1<Y.temp)
   }
   P.bar<-rowMeans(P)
   Q.bar<-rowMeans(Q)
   V1<-rowSums((P-P.bar)^2)
   V2<-rowSums((Q-Q.bar)^2)
   U.hat<-(rowSums(Q)-rowSums(P))/(2*sqrt(V1+V2+P.bar*Q.bar))
   p.val<-2-2*pnorm(abs(U.hat))
   ebp.res<-grenander.ebp(p.val)
   res<-cbind.data.frame(stat=U.hat,pval=p.val,ebp=ebp.res$ebp)
   return(res)
}

