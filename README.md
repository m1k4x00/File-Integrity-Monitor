# File-Integrity-Monitor

## Introduction
The goal of this project was to create a general proof of consecpt for a file integrity monitor using both powershell and bash. The scripts first creates a base file to which it compares the monitored files. 
If any changes are made to the folder where the files are the script will let the user know eq. new file created, existing file deleted or a file is edited.

## Demo with powershell

First we create the base file by selecting the A option

![262716911-d0db326f-bc66-4482-ae05-b0666f9c66c2](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/bfbb8830-e9cf-4f6c-bb43-63fa984f4f54)

Then we can start monitoring by selecting option B

If we for example edit File 1.txt we get alerts immediatly

![262717730-8361522e-3505-4021-86e0-5e76a4ce4aa2](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/b1a75297-bcb0-4017-9a86-78c94e258006)

The same happens if we add a file to the folder

![262718094-9d4ccfab-42f5-4845-b732-90f39b0ce625](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/680e1226-8c80-4f41-8f29-e45629562fb8)

Or delete a file

![262718504-f9a19d8b-5f70-4ae4-a315-48a223cb5799](https://github.com/m1k4x00/File-Integrity-Monitor/assets/142576207/d07e3d41-95ef-4336-ad8c-d84b274a2a2c)

The bash script works the exact same way
