
user = 16361
server = ch-s010.rsync.net
directory = xps13

repository = $(user)@$(server):$(directory)

list:
	borg --remote-path=borg1 list $(repository)
info:
	borg --remote-path=borg1 info $(repository)
quota:
	ssh $(user)@$(server) quota
backup:
	./create_backup.sh
