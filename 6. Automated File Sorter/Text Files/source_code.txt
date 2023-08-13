# Automated File Sorter Project in Python

import os, shutil

path = r"E:/Projects/Automated File Sorter/"

file_name = os.listdir(path)

folder_names = ['Images', 'Word Documents', 'Text Files']

for i in range(len(folder_names)):
    if not os.path.exists(path + folder_names[i]):
        os.makedirs(path + folder_names[i])

for i in file_name:
    if '.txt' in i and not os.path.exists(path + 'Text Files/' + i):
        shutil.move(path + i, path + 'Text Files/' + i)
    elif '.docx' in i and not os.path.exists(path + 'Word Documents/' + i):
        shutil.move(path + i, path + 'Word Documents/' + i)
    elif '.jpg' in i and not os.path.exists(path + 'Images/' + i):
        shutil.move(path + i, path + 'Images/' + i)