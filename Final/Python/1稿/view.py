from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import inspect
import ctypes
import pymysql
from tkinter.scrolledtext import ScrolledText


class App:
    def __init__(self):
        self.username = "root"
        self.password = "123456"
        self.sqlname = "school"
        self.tks = []
        self.tasks = []
        self.win = Tk()
        self.win.title("学生信息管理系统")
        self.win.geometry("500x300+50+150")
        self.win.resizable(0, 0)
        self.views()
        self.run()

    def views(self):
        # 插入学生信息、插入老师信息，查看所有学生信息+输入学号可以查看该学生信息（方便的话尽可能列出所有学生信息吧选课、班级、宿舍、图书借阅情况，不方便实现的话就查看个别信息就好）、查看所有选课信息+输入课程编号查看该课程的相关信息）
        Label(self.win, text='学生信息管理系统', font=("宋体", 24, "bold")).place(x=100, y=20, width=300, height=30)

        ttk.Button(self.win, text="插入学生信息", command=self.insert_student).place(x=50, y=110, height=30, width=150)
        ttk.Button(self.win, text="插入老师信息", command=self.insert_teacher).place(x=300, y=110, height=30, width=150)
        ttk.Button(self.win, text="查看学生信息", command=self.select_student).place(x=50, y=180, height=30, width=150)
        ttk.Button(self.win, text="查看选课信息", command=self.select_class).place(x=300, y=180, height=30, width=150)
        ttk.Button(self.win, text="退出系统", command=self.close_win).place(x=350, y=260, height=25, width=100)

    def close_win(self):
        self.win.destroy()

    # 插入学生信息
    def insert_student(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=70, width=480, height=230)
        Label(f, text="添加学生信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        ttk.Label(f, text="编号：").place(x=10, y=40, height=25)
        s_num = ttk.Entry(f)
        s_num.place(x=50, y=40, width=100, height=25)

        ttk.Label(f, text="姓名：").place(x=10, y=75, height=25)
        s_name = ttk.Entry(f)
        s_name.place(x=50, y=75, width=100, height=25)

        ttk.Label(f, text="密码：").place(x=10, y=110, height=25)
        s_pwd = ttk.Entry(f)
        s_pwd.place(x=50, y=110, width=100, height=25)

        ttk.Label(f, text="性别：").place(x=10, y=145, height=25)
        s_sex = ttk.Entry(f)
        s_sex.place(x=50, y=145, width=100, height=25)

        ttk.Label(f, text="班级编号：").place(x=180, y=40, height=25)
        cls_num = ttk.Entry(f)
        cls_num.place(x=240, y=40, width=100, height=25)

        ttk.Label(f, text="生日：").place(x=180, y=75, height=25)
        s_date = ttk.Entry(f)
        s_date.place(x=220, y=75, width=120, height=25)

        ttk.Label(f, text="电话：").place(x=180, y=110, height=25)
        s_tel = ttk.Entry(f)
        s_tel.place(x=220, y=110, width=120, height=25)
        controls = [s_num, s_pwd, s_sex, s_name, s_date, s_tel, cls_num]

        ttk.Button(f, text="插 入", command=lambda conts=controls: self.insert_func(conts, "学生")).place(x=390, y=150, width=60)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=390, y=190, width=60)

    def insert_teacher(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=70, width=480, height=230)
        Label(f, text="添加老师信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        ttk.Label(f, text="编号：").place(x=10, y=40, height=25)
        t_num = ttk.Entry(f)
        t_num.place(x=50, y=40, width=100, height=25)

        ttk.Label(f, text="姓名：").place(x=10, y=75, height=25)
        t_name = ttk.Entry(f)
        t_name.place(x=50, y=75, width=100, height=25)

        ttk.Label(f, text="性别：").place(x=10, y=105, height=25)
        t_sex = ttk.Entry(f)
        t_sex.place(x=50, y=105, width=100, height=25)

        ttk.Label(f, text="邮箱：").place(x=10, y=140, height=25)
        t_email = ttk.Entry(f)
        t_email.place(x=50, y=140, width=100, height=25)

        ttk.Label(f, text="电话：").place(x=10, y=175, height=25)
        t_tel = ttk.Entry(f)
        t_tel.place(x=50, y=175, width=100, height=25)

        ttk.Label(f, text="学院编号：").place(x=180, y=40, height=25)
        xy_num = ttk.Entry(f)
        xy_num.place(x=240, y=40, width=100, height=25)

        ttk.Label(f, text="薪资：").place(x=180, y=75, height=25)
        t_xz = ttk.Entry(f)
        t_xz.place(x=220, y=75, width=120, height=25)

        ttk.Label(f, text="生日：").place(x=180, y=110, height=25)
        t_date = ttk.Entry(f)
        t_date.place(x=220, y=110, width=120, height=25)

        ttk.Label(f, text="密码：").place(x=180, y=145, height=25)
        t_pwd = ttk.Entry(f)
        t_pwd.place(x=220, y=145, width=120, height=25)
        controls = [t_num, t_name, t_email, t_sex, t_tel, t_xz, t_date, t_pwd, xy_num]

        ttk.Button(f, text="插 入", command=lambda conts=controls: self.insert_func(conts, "教师")).place(x=390, y=150, width=60)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=390, y=190, width=60)

    # 插入数据
    def insert_data(self, tableName, data):
        res = 1
        # 连接数据库
        db = pymysql.connect("127.0.0.1", self.username, self.password, self.sqlname)
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

    # 查询数据
    def select_student(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=60, width=480, height=230)
        Label(f, text="查询学生信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        Label(f, text="学号：", font=("宋体", 11, "bold")).place(x=10, y=35, height=25)
        s_num = ttk.Entry(f)
        s_num.place(x=60, y=35, width=200, height=25)
        ttk.Button(f, text="查 询", command=lambda w=s_num: self.select_sdata(w)).place(x=280, y=35, width=60)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=350, y=35, width=60)

        self.student_info = ScrolledText(f)
        self.student_info.place(x=10, y=70, width=460, height=150)

    # 查询数据
    def select_class(self):
        f = ttk.Frame(self.win)
        f.place(x=20, y=60, width=480, height=230)
        Label(f, text="查询选课信息：", font=("宋体", 16, "bold")).place(x=10, y=0)

        Label(f, text="编号：", font=("宋体", 11, "bold")).place(x=10, y=35, height=25)
        cls_num = ttk.Entry(f)
        cls_num.place(x=60, y=35, width=200, height=25)
        ttk.Button(f, text="查 询", command=lambda w=cls_num: self.select_cdata(w)).place(x=280, y=35, width=60)
        ttk.Button(f, text="返 回", command=f.destroy).place(x=350, y=35, width=60)

        self.cls_info = ScrolledText(f)
        self.cls_info.place(x=10, y=70, width=460, height=150)

    def select_cdata(self, w):
        self.cls_info.delete(0.0, END)
        cls_num = w.get()
        db = pymysql.connect("127.0.0.1", self.username, self.password, self.sqlname)  # 连接数据库
        cursor = db.cursor()  # 创建一个cursor对象（游标）
        sql = "select * from 课程 where 编号='{}';".format(cls_num)
        try:
            cursor.execute(sql)
            results = cursor.fetchall()
            if results:
                self.cls_info.insert(END, "编号：{}\n".format(results[0][0]))
                self.cls_info.insert(END, "名称：{}\n".format(results[0][1]))
                self.cls_info.insert(END, "考试类型：{}\n".format(results[0][2]))
                self.cls_info.insert(END, "学分：{}\n".format(results[0][3]))
                self.cls_info.insert(END, "类别：{}\n".format(results[0][4]))
            else:
                self.cls_info.insert(END, "编号错误，查无记录\n")
        except Exception as e:
            db.rollback()
            print("error:", e)
        cursor.close()  # 关闭连接
        db.close()

    def select_sdata(self, w):
        self.student_info.delete(0.0, END)
        s_num = w.get()
        db = pymysql.connect("127.0.0.1", self.username, self.password, self.sqlname)  # 连接数据库
        cursor = db.cursor()  # 创建一个cursor对象（游标）
        sql = "select * from 学生 where 编号={};".format(s_num)
        try:
            cursor.execute(sql)
            results = cursor.fetchall()
            if results:
                self.student_info.insert(END, "查询结果：\n学号：{}\n".format(results[0][0]))
                self.student_info.insert(END, "姓名：{}\n".format(results[0][1]))
                self.student_info.insert(END, "性别：{}\n".format(results[0][2]))
                self.student_info.insert(END, "密码：{}\n".format(results[0][3]))
                self.student_info.insert(END, "生日：{}\n".format(results[0][4]))
                self.student_info.insert(END, "电话：{}\n".format(results[0][5]))
                self.student_info.insert(END, "班级编号：{}\n".format(results[0][6]))
            else:
                self.student_info.insert(END, "学号错误，查无此人\n")
        except Exception as e:
            db.rollback()
            print("error:", e)
        sql = "select * from 选课 where 学号={};".format(s_num)
        try:
            cursor.execute(sql)
            results = cursor.fetchall()
            if results:
                self.student_info.insert(END, "\n选课信息：\n课程编号：{}\n".format(results[0][1]))
                self.student_info.insert(END, "分数：{}\n".format(results[0][2]))
                self.student_info.insert(END, "考试时间：{}\n".format(results[0][3]))
                self.student_info.insert(END, "考试地点：{}\n".format(results[0][4]))
                self.student_info.insert(END, "选课时间：{}\n".format(results[0][5]))
            else:
                self.student_info.insert(END, "没有选课信息\n")
        except Exception as e:
            db.rollback()
            print("error:", e)
        cursor.close()  # 关闭连接
        db.close()

    def insert_func(self, controls, t):
        result = []
        for control in controls:
            res = control.get()
            # if not res:
            #     res = "NULL"
            result.append(res)
        print(t, result)
        res = self.insert_data(t, result)
        if res:
            messagebox.showinfo("提示", "信息插入成功")
        else:
            messagebox.showerror("提示", "信息插入失败")

    # 停止任务的方法
    def _async_raise(sekf, tid, exctype):
        """Raises an exception in the threads with id tid"""
        if not inspect.isclass(exctype):
            raise TypeError("Only types can be raised (not instances)")
        res = ctypes.pythonapi.PyThreadState_SetAsyncExc(ctypes.c_long(tid), ctypes.py_object(exctype))
        if res == 0:
            raise ValueError("invalid thread id")
        elif res != 1:
            # """if it returns a number greater than one, you're in trouble,
            # and you should call it again with exc=NULL to revert the effect"""
            ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, None)
            raise SystemError("PyThreadState_SetAsyncExc failed")

    def stop_thread(self, thread):
        try:
            self._async_raise(thread.ident, SystemExit)
        except Exception as e:
            print(e)

    # 消息主循环
    def run(self):
        self.win.mainloop()


if __name__ == "__main__":
    app = App()
