/*
 * Author: Mohamed Lamine KARAOUI
 */

#include "hist.h"                /* Created by rpcgen */
#include <string.h>



#define QR_TST_STRING "QUERY RPC TEST SUCCEFULLY"


struct query_res_s *
query_1_svc(struct query_arg_s* arg, struct svc_req *req)
{
	static id;
	static query_res_s res;

	/* Free previous result */
	xdr_free((xdrproc_t)xdr_query_res_s, (char*)&res);

	/* FIXME: Fill res using hcache.c */
	res.error = 0;
	res.id = id++;
	res.desc = calloc(1, strlen(QR_TST_STRING)+1);
	strcpy(res.desc, QR_TST_STRING);

	return &res;
}


int* 
add_1_svc(struct add_arg_s *arg, struct svc_req *req)
{
	static int res;

	printf("Adding new event: day %d, month %d, desc %s\n", 
			arg->date.day, arg->date.month, arg->desc);

	res = 1;

	return &res;
}
