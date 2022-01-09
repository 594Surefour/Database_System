from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import inspect
import ctypes
import pymysql
from tkinter.scrolledtext import ScrolledText
from login_stu import *
import login_stu

class App:
    def __init__(self):
        #print(xh)
        self.username = "root"
        self.password = "123456"
        self.sqlname = "school"
        self.win = Tk()
        self.win.title("本科生公共数据库")
        self.win.geometry("500x300+50+150")
        self.win.resizable(0, 0)
        self.views()
        self.run()


    def views(self):
        Label(self.win, text='学生信息管理系统', font=("宋体", 24, "bold")).place(x=100, y=20, width=300, height=30)
        ttk.Button(self.win, text="查看开课信息", command=self.select_class).place(x=300, y=100, height=100, width=150)
        ttk.Button(self.win, text="添加选课信息", command=self.insert_class).place(x=50, y=100, height=100, width=150)
        ttk.Button(self.win, text="退出系统", command=self.close_win).place(x=350, y=265, height=25, width=100)

    def close_win(self):
        self.win.destroy()

    # 插入数据
    def insert_data(self, tableName, data):
        res = 1
        # 连接数据库
        db = pymysql.connect(host="localhost", user=self.username, password=self.password, db=self.sqlname)
        cursor = db.cursor()  # 创建一个cursor对象（游标）
        data_str = "'" + "','".join(data).replace("\n", "") + "'"
        print(data_str)
        sql = "insert into {} values({});".format(tableName, data_str)
        # 执行 sql 语句
        try:
            cursor.execute(sql)
            # 提交事务
            db.commit()
        except Exception as e:
            # 如果提交失败，回滚到上一次的数据
            db.rollback()
            # 打印异常
            print("error:", e)
            res = 0
        cursor.close()  # 关闭连接
        db.close()
        return res

    def insert_func(self, controls, t):
        result = []
        for control in controls:
            res = control.get()
            # if not res:
            #     res = "NULL"
            result.append(res)
        print(t, result)
        if (len(result) == 7):
            result.append("100")
        res = self.insert_data(t, result)
        if res:
            messagebox.showinfo("提示", "信息插入成功")
        else:
            messagebox.showerror("提示", "选课失败-意愿值不足或编号错误")

    # 查询数据
    def select_class(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=60, width=480, height=230)
        Label(f, text="查询课程信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        Label(f, text="编号：", font=("宋体", 11, "bold")).place(x=10, y=35, height=25)
        cls_num = ttk.Entry(f)
        cls_num.place(x=60, y=35, width=200, height=25)
        ttk.Button(f, text="查 询", command=lambda w=cls_num: self.select_cdata(w)).place(x=280, y=35, width=80)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=380, y=35, width=80)

        self.cls_info = ScrolledText(f)
        self.cls_info.place(x=10, y=70, width=460, height=150)

    def select_cdata(self, w):
        self.cls_info.delete(0.0, END)
        cls_num = w.get()
        db = pymysql.connect(host="localhost", user=self.username, password=self.password, db=self.sqlname)  # 连接数据库
        cursor = db.cursor()  # 创建一个cursor对象（游标）
        sql = "select * from 开设课程 where 课程编号='{}';".format(cls_num)
        try:
            cursor.execute(sql)
            results = cursor.fetchall()
            if results:
                self.cls_info.insert(END, "课程编号：{}\n".format(results[0][0]))
                self.cls_info.insert(END, "开课学期：{}\n".format(results[0][1]))
                self.cls_info.insert(END, "课程名称：{}\n".format(results[0][2]))
                self.cls_info.insert(END, "课程类别：{}\n".format(results[0][3]))
                self.cls_info.insert(END, "考试时间：{}\n".format(results[0][4]))
                self.cls_info.insert(END, "考试地点：{}\n".format(results[0][5]))
                self.cls_info.insert(END, "选课开始时间：{}\n".format(results[0][6]))
                self.cls_info.insert(END, "选课截止时间：{}\n".format(results[0][7]))
                self.cls_info.insert(END, "人数上限：{}\n".format(results[0][8]))
            else:
                self.cls_info.insert(END, "开课编号错误，查无记录\n")
        except Exception as e:
            db.rollback()
            print("error:", e)
        cursor.close()  # 关闭连接
        db.close()


        #插入选课信息
    def insert_class(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=70, width=480, height=230)
        Label(f, text="添加学生选课信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        ttk.Label(f, text="学号：").place(x=10, y=40, height=25)
        stu_num = ttk.Entry(f)
        stu_num.place(x=80, y=40, width=300, height=25)

        ttk.Label(f, text="课程编号：").place(x=10, y=75, height=25)
        class_num = ttk.Entry(f)
        class_num.place(x=80, y=75, width=300, height=25)

        ttk.Label(f, text="意愿值：").place(x=10, y=105, height=25)
        val = ttk.Entry(f)
        val.place(x=80, y=105, width=300, height=25)

        controls = [stu_num, class_num, val]

        ttk.Button(f, text="插 入", command=lambda conts=controls: self.insert_func(conts, "选课")).place(x=390, y=150, width=80)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=390, y=190, width=80)

    # 消息主循环
    def run(self):
        self.win.mainloop()

if __name__ == "__main__":
    app = App()
