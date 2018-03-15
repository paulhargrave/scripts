import os, sys


def renumber_file(file_name, root):
    original_track_number = int(file_name[:2])
    new_track_number = original_track_number + offset

    new_filename = str(new_track_number) + file_name[2:]
    original_full_path = os.path.join(root, file_name)
    new_full_path = os.path.join(root, new_filename)

    print original_full_path + "--->"  + new_full_path

    os.rename(original_full_path, new_full_path)



# checking whether path and filename are given.
if len(sys.argv) != 3:
    print "Usage : python rename.py <path> <offset>"
    sys.exit()

offset = int(sys.argv[2])

try:
    for root, dirs, files in os.walk(sys.argv[1]):
        for file_name in files:
            if file_name.endswith("flac"):
                renumber_file(file_name, root)


            # creating the rename pattern.
            # s = "%spic_folder/%s%s%s" %(x[0], name[0], count, name[1])
            # # getting the original path of the file to be renamed.
            # z = os.path.join(x[0],y)
            # # renaming.
            # os.rename(z, s)

except OSError:
    pass


