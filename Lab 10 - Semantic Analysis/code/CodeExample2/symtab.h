#ifndef SYMTAB_H
#define SYMTAB_H

#define MAX_NAME_LEN 100

// Symbol table node
typedef struct list_t {
    char st_name[MAX_NAME_LEN];
    int st_type;
    struct list_t *next;
} list_t;

// Type enums
#define UNDEF_TYPE 0
#define INT_TYPE   1
#define REAL_TYPE  2
#define CHAR_TYPE  3

// Type name mapping
static const char* typename[] = {
    "undefined",
    "int",
    "real",
    "char"
};

// Function declarations
void insert(char* name, int type);
list_t* search(char *name);
int idcheck(char* name);
int gettype(char *name);
int typecheck(int type1, int type2);

#endif
