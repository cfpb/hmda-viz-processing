import psycopg2
import psycopg2.extras

class connect_DB(object): #connects to the SQL database
    #this is currently hosted locally
    def connect(self):

       # with open('/Users/roellk/Desktop/python/credentials.txt', 'r') as f: #read in credentials file
         #   credentials = f.read()
        #cred_list = credentials.split(',')
        #dbname = cred_list[0]
        #user = cred_list[1]
        #host = cred_list[2]
        #password = cred_list[3]


        #parameter format
        params = {
        'dbname':'hmda',
        'user':'docker',
        'password':'docker',
        'host':'192.168.59.103',
        'port':'5432'
        }

        #connect_string = "dbname=%s user=%s host=%s password =%s" %(dbname, user, host, password) #set a string for connection to SQL
        try:
            conn = psycopg2.connect(**params)
            print "i'm connected"
        except psycopg2.Error as e: #if database connection results in an error print the following
            print "I am unable to connect to the database: ", e
        return conn.cursor(cursor_factory=psycopg2.extras.DictCursor) #return a dictionary cursor object




