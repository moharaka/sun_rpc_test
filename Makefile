XFILE=hist.x
CFILES=hist.c
SFILES=hserver.c

CC=gcc
CFLAGS=-O2 -lnsl

XDR_FILE=$(patsubst %.x,%_xdr.c, $(XFILE))
CLNT_FILE=$(patsubst %.x,%_clnt.c, $(XFILE))
SVC_FILE=$(patsubst %.x,%_svc.c, $(XFILE))
HDR_FILE=$(patsubst %.x,%.h, $(XFILE))

CEXEC=$(patsubst %.c,%, $(CFILES))
SEXEC=$(patsubst %.c,%, $(SFILES))


all:
	rpcgen $(XFILE) 
	$(CC) $(CFLAGS) $(CFILES) $(CLNT_FILE) $(XDR_FILE) -o $(CEXEC) 
	$(CC) $(CFLAGS) $(SFILES) $(SVC_FILE) $(XDR_FILE) -o $(SEXEC)

clean:
	rm $(CLNT_FILE) $(SVC_FILE) $(XDR_FILE) $(HDR_FILE) $(SEXEC) $(CEXEC)
