library(igraph)
start_time <- Sys.time()
table <- read.table("cit-Patents.txt")
newg<- graph.data.frame(table, directed=TRUE)

end_time <- Sys.time()
end_time - start_time
print("cit-Patents.txt")


print("number of vx:")
vcount(newg)
print("number of edge:")
ecount(newg)

# Remove self-loops for consistency
newg <- invisible(simplify(newg, remove.loops = TRUE))

# k-core
start_time <- Sys.time()
invisible(core <-coreness(newg, mode = "all"))
invisible(verticeHavingthreeCoreness <- which(core == 3))
invisible(threecore <- induced.subgraph(graph=newg,vids=verticeHavingthreeCoreness))
end_time <- Sys.time()
end_time - start_time

# page rank
start_time <- Sys.time()
invisible(page_rank_old(newg, niter = 10, eps = 0.0001))
end_time <- Sys.time()
end_time - start_time

# WCC
start_time <- Sys.time()
invisible(components(newg, mode = "weak"))
end_time <- Sys.time()
end_time - start_time

#clustering coeff
start_time <- Sys.time()
transitivity(newg)
end_time <- Sys.time()
end_time - start_time

#test edge existence
start_time <- Sys.time()
a<-sample(1:vcount(newg),2)
i<-1

are.connected(newg, a[i], a[i+1])

end_time <- Sys.time()
end_time - start_time






