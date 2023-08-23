# File-Integrity-Monitor

## Introduction
The goal of this project was to create a general proof of consecpt for a file integrity monitor using both powershell and bash. The scripts first creates a base file to which it compares the monitored files. 
If any changes are made to the folder where the files are the script will let the user know eq. new file created, existing file deleted or a file is edited.

## Demo with powershell

First we create the base file by selecting the A option

![image](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/d0db326f-bc66-4482-ae05-b0666f9c66c2)

Then we can start monitoring by selecting option B

If we for example edit File 1.txt we get alerts immediatly

![image](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/8361522e-3505-4021-86e0-5e76a4ce4aa2)

The same happens if we add a file to the folder

![image](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/9d4ccfab-42f5-4845-b732-90f39b0ce625)

Or delete a file
![image](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/f9a19d8b-5f70-4ae4-a315-48a223cb5799)

The bash script works the exact same way
