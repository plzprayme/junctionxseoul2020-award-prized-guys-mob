db = {
    'user': 'INPUT YOUR USERNAME',  # insert db config
    'password': 'INPUT YOUR PASSWORD',
    'host': 'INPUT YOUR HOST',
    'port': '3306',
    'database': 'mob'
}

DB_URL = f"mysql+mysqlconnector://{db['user']}:{db['password']}@{db['host']}:{db['port']}/{db['database']}?charset=utf8"