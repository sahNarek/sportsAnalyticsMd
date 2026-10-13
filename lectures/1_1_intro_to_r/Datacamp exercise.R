# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {print("Showing LinkedIn information")} else if (medium == "Facebook") {print("Showing Facebook information")} else {print("Unknown medium")}

# Control structure for num_views
if (num_views > 15) {print("You're popular!")} else if (num_views <= 15 & num_views > 10) {print("Your Number of views is avarage")} else {print("Try to be more visible!")}
