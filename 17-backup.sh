USERID=$(id -u) # Display UserID value, For root user its 0
R="\e[31m" # Print Red color
G="\e[32m" # Print Green color
Y="\e[33m" # Print Yellow color
N="\e[0m" # Print Default White color
LOGS_FOLDER="/home/ec2-user/app-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing no. of days, then 14 days will be taken default

mkdir -p $LOGS_FOLDER
echo "Created the $LOGS_FOLDER directory"

if [ $# -ls 2 ]
then
echo -e "$R USAGE:: $N sh 17-backup.sh <source dir> <dest dir> <Days>"
exit 1
fi

if [ ! -d "$SOURCE_DIR" ]
then
echo -e "$R Error:: $N Source dir doesn't exists"
exit 1 
fi

if [ ! -d "$DEST_DIR" ]
then
echo -e "$R Error:: $N Destination dir doesn't exists"
exit 1 
fi

echo "Starting script at the time stamp :: $TIMESTAMP"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
if [ -n "$FILES" ]
then
    echo "Files Exists in the :: $SOURCE_DIR"
    ZIPFILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIPFILE"
    if [ -f "$ZIPFILE" ]
    then
        echo -e "successfully created zip files older than $DAYS"
        while read -r filepath  # Here filepath is variable name and we can give any name
        do 
        echo "Deleting the files $filepath"
        rm -rf $filepath
        done <<< $FILES

    else
        echo -e "$R ERROR:: $N Failed to create zip file"
        exit 1
    fi

else
    echo -e "$R ERROR:: $N Files doesn't Exists in the $SOURCE_DIR older then $DAYS"
fi  