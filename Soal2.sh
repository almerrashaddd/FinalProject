#!/bin/bash

# Variables for the first condition
path="/hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path/$name_of_directory"

if [ -d "$path/$name_of_directory" ]; then
  echo "There is $name_of_directory Directory Exists!"
else
  echo "$name_of_directory Directory Not Exists!"
  
  mkdir -p "$path/$name_of_directory"
  
  if [ $? -eq 0 ]; then
    echo "Created $name_of_directory Directory"
  else
    echo "Failed to create $name_of_directory Directory"
    exit 1
  fi
fi

if [ -f "$source_dir/$filename_excel" ]; then

  cp "$source_dir/$filename_excel" "$target_dir/$filename_excel"
  
  if [ $? -eq 0 ]; then
    echo "File $filename_excel Moved Successfully"
  else
    echo "Failed to move $filename_excel"
  fi
else
  echo "Source file $filename_excel does not exist."
fi
