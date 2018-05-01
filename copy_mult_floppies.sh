for i in `ls *.img`
do
	sudo umount /media/paul/floppy
	sudo mount -o loop $i /media/paul/floppy
	dirname=`echo $i | sed "s/\..*//"`
	
	
	
	mkdir -p $1/$dirname
	cp -r /media/paul/floppy/* $1/$dirname
done	
