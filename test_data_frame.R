
testfile <- data_frame(
    v1 = as.integer(runif(5, 2000, 20084)),
    v2 = c(
                          "Office Depot Credit Plan"  ,
                          "Political Survival Fund" ,
                          "Political Survival Fund" ,
                          "MASSA FOR CONGRESS",
                          "RENT-A-WRECK"),
    street = c(
                          "459 Third St.",
                          "Jupiter, FL 33458",
                          "75 George Drive",
                          " 8688 Snake Hill St.",
                          "Palos Verdes Peninsula, CA 90274"),
    city = c("BEAUFORT" ,   "Tunkhannock", 
                               "WASHINGTON" , "Dallas"  ,    
                               "Phoenix"  ),
    state = c("PA", "SC", "DC", "CA", "PA"),
    date = (lubridate::today()+1:5) ,
    amount = as.double(c(118.72 ,  594.00,    85.54, 13333.80,    10.00)),
    cat = c("Events/Meetings", "Earmarked by John Newhouse",
             "Transaction Fees","Contribution","Contribution")
                      )

