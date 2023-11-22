#explore data

#What are the total cases?
total_cases <- sum(ae_a$Cases)

#How rows many are in our three groups?
table(ae_a$UseError)

#What are the total use errors?
total_useerrors <- sum(ae_a$Cases[ae_a$UseError == 1])

#What are the total <40 errors (unclassified)?
total_unclass <- sum(ae_a$Cases[ae_a$UseError == 3])

#What about the rest?
total_nonuseerrors <- total_cases - (total_useerrors + total_unclass)

#Checksum
identical(total_cases, total_nonuseerrors + total_useerrors + total_unclass)


