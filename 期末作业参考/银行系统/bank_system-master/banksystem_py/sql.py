import pymysql
mysql=None
class SQLdata():
    sql=None
    def __init__(self):
        self.sql=None
    def connect(self):
        try:
            self.sql=pymysql.Connect(host='localhost', port=3306, user='root', password='123456', database='Final', charset='utf8')
            print("success:连接db成功")
        except:
            print("error:连接db失败")
            return None
        return self.sql
    def close(self):
        self.sql.close()
        self.sql=None
if(mysql==None):
    mysql=SQLdata()
def getMySql():
    return mysql
