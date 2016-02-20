/*
 * Author: Mohamed Lamine KARAOUI
 */

typedef string nametype<>;			/* event entry */

struct date_s {
	char day;
	char month;
};

/* The add request args */
struct add_arg_s {
	struct date_s date;
	string desc<>;
};

struct query_res_s {
	int id;
	int error;
	string desc<>;
};

struct query_arg_s {
	int id;
	struct date_s date;
};


/* The directory program definition */
program HISTPROG {
	version HISTVERS {
		int ADD(struct add_arg_s) = 1;
		struct query_res_s QUERY(struct query_arg_s) = 2;
	} = 1;
} = 0x20000076; 
