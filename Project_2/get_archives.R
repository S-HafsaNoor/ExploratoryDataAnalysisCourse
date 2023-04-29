# Check if archive file exists, if not then download it
a_file <- "NEI_data.zip"

if(!file.exists(a_file)) {
    # URL of the archive file to be downloaded
    a_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"


    # Download the archive file
    download.file(url=a_url, destfile=a_file)
}

# Check if summarySCC_PM25.rds and Source_Classification_Code.rds files exist in the current directory, if not then extract them from the archive file
if(!(file.exists("summarySCC_PM25.rds") && file.exists("Source_Classification_Code.rds"))) {
    unzip(a_file)
}