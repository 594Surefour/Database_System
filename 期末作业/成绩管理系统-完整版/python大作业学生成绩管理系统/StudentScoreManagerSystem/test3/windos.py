import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
import pandas as pd  # 读取数据
import os
import numpy as np

def set_win_center(root, curWidth='', curHight=''):
    '''
    设置窗口大小，并居中显示
    :param root:主窗体实例
    :param curWidth:窗口宽度，非必填，默认200
    :param curHight:窗口高度，非必填，默认200
    :return:无
    '''
    if not curWidth:
        '''获取窗口宽度，默认200'''
        curWidth = root.winfo_width()
    if not curHight:
        '''获取窗口高度，默认200'''
        curHight = root.winfo_height()
    # print(curWidth, curHight)

    # 获取屏幕宽度和高度
    scn_w, scn_h = root.maxsize()
    # print(scn_w, scn_h)

    # 计算中心坐标
    cen_x = (scn_w - curWidth) / 2
    cen_y = (scn_h - curHight) / 2
    # print(cen_x, cen_y)

    # 设置窗口初始大小和位置
    size_xy = '%dx%d+%d+%d' % (curWidth, curHight, cen_x, cen_y)
    root.geometry(size_xy)


# 登录界面窗口
class LoginWindows(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        # 标题
        self.frameTop = tk.Frame(self)
        self.text = tk.Label(self.frameTop, text="学生管理系统", font=("微软雅黑", 25, 'bold'))
        self.text.pack(padx=20, pady=15)
        self.frameTop.pack()

        # 账号输入
        self.frameAccount = tk.Frame(self)
        self.accountLabel = tk.Label(self.frameAccount, text='账号：', font=("微软雅黑", 15, 'bold'))
        self.account= tk.Entry(self.frameAccount)
        self.accountLabel.pack(side='left', fill='x', expand='no', pady=5)
        self.account.pack(side='left', fill='x', expand='no', pady=5)
        self.frameAccount.pack()

        # 密码输入
        self.framePassword = tk.Frame(self)
        self.passwordLabel = tk.Label(self.framePassword, text='密码：', font=("微软雅黑", 15, 'bold'))
        self.password = tk.Entry(self.framePassword, show='*')
        self.passwordLabel.pack(side='left', fill='x', expand='no', pady=5)
        self.password.pack(side='left', fill='x', expand='no', pady=5)
        self.framePassword.pack()

        # 管理员和学生选择按键
        self.frameChoose = tk.Frame(self)
        self.identify = tk.IntVar()
        tk.Radiobutton(self.frameChoose, text='管理员', font=("微软雅黑", 10, 'bold'),variable=self.identify, value=0).pack(side='left', padx=15, pady=5)

        tk.Radiobutton(self.frameChoose, text='学生', font=("微软雅黑", 10, 'bold'),variable=self.identify, value=1).pack(side='left', padx=15, pady=5)
        self.frameChoose.pack()


        # 登录按钮
        self.loginButton = tk.Button(self, text='登录', font=("微软雅黑", 12, 'bold'),
                                     command=self.login, width=20)
        self.loginButton.pack(pady=10)

    def login(self):
        account = self.account.get()
        password = self.password.get()
        status = self.identify.get()
        if status == 0:  # 管理员模式
            if os.path.exists('./data/Manage-Account/manage.xlsx'):
                data = pd.read_excel('./data/Manage-Account/manage.xlsx')
                accounts = data['account']
                passwords = data['password']
                index = np.where(accounts == account)[0]
                # 判断管理员账号是否存在
                if index.shape[0] == 0:
                    messagebox.showinfo(title='Error', message='管理员账号不存在')
                    self.account.delete(0, 'end')
                    self.password.delete(0, 'end')
                else:
                    if str(passwords[index[0]]) == password:
                        # 进入系统
                        self.destroy()
                        ManageWindows(self.master, **(data.loc[index[0], :].to_dict()))
                        set_win_center(self.master, 800, 400)
                    else:
                        messagebox.showinfo(title='Error', message='密码错误')
                        self.password.delete(0, 'end')
            else:
                messagebox.showinfo(title='Error', message='管理员账户数据库不存在')
                self.account.delete(0, 'end')
                self.password.delete(0, 'end')

        elif status == 1:  # 学生模式
            if os.path.exists('./data/Student-Account/student.xlsx'):
                data = pd.read_excel('./data/Student-Account/student.xlsx')
                accounts = data['account']
                passwords = data['password']
                index = np.where(accounts == account)[0]
                # 判断学生账号是否存在
                if index.shape[0] == 0:
                    messagebox.showinfo(title='Error', message='学生账号不存在')
                    self.account.delete(0, 'end')
                    self.password.delete(0, 'end')
                else:
                    if str(passwords[index[0]]) == password:
                        # 进入系统
                        self.destroy()
                        StudentWindows(self.master, **data.loc[index[0], :].to_dict())
                        set_win_center(self.master, 800, 400)
                    else:
                        messagebox.showinfo(title='Error', message='密码错误')
                        self.password.delete(0, 'end')
            else:
                messagebox.showinfo(title='Error', message='学生账户数据库不存在')
                self.account.delete(0, 'end')
                self.password.delete(0, 'end')

# 学生成绩查询界面
class StudentWindows(tk.Frame):
    def __init__(self, master=None, **kwargs):
        self.info = kwargs
        self.student = pd.read_excel('./data/Student-Account/student.xlsx')
        super().__init__(master)
        self.master = master
        self.pack(expand='no', fill='x')
        self.create_widgets()

    def create_widgets(self):
        # 1. 学生信息
        # 第一行信息
        self.info1 = tk.Frame(self)
        self.info1.pack(side='top', expand='yes', fill='x', pady=10, padx=20)
        tk.Label(self.info1,
                 text='账号: {:20s}'.format(self.info['account']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')
        tk.Label(self.info1,
                 text='姓名: {:20s}'.format(self.info['name']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')

        # 第二行信息
        self.info2 = tk.Frame(self)
        self.info2.pack(side='top', expand='yes', fill='x', pady=10, padx=20)
        tk.Label(self.info2,
                 text='性别: {:24s}'.format(self.info['sex']),  # 对齐，中文长度和占的字节数和英文不同
                 font=("微软雅黑", 15, 'bold')).pack(side='left')
        tk.Label(self.info2,
                 text='职称: {:20s}'.format(self.info['profession']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')

        # 添加一行
        tk.Frame(self).pack(side='top', ipady=10, fill='x')



        # 2. 成绩栏表格
        self.treeFrame = tk.Frame(self)
        self.treeFrame.pack(side='top', expand='yes', fill='x', padx=20, pady=10)
        # 2.1 创建表格
        self.scoreTree = ttk.Treeview(self.treeFrame, show='headings')
        self.scoreTree.pack(side='left', expand='yes', fill='x')
        # 2.2 定义列
        self.scoreTree['columns'] = ['课程名称', '学期', '任课老师', '学分', '成绩']
        # 2.3 设置列宽度和列名
        for i in self.scoreTree['columns']:
            self.scoreTree.column(i, width=20, anchor='center')  # 设置宽度
            self.scoreTree.heading(i, text=i)  # 设置列名
        # 2.4 显示数据
        file = './data/Student-score/{}.txt'.format(self.info['account'])
        with open(file, 'r', encoding='utf-8') as f:
            datas = f.readlines()
        for num, data in enumerate(datas):
            data = data.strip('\n').split(' ')
            self.scoreTree.insert('', num, values=data)
        # 2.5 添加滚动条
        self.scrollbar = tk.Scrollbar(self.treeFrame, orient='vertical', command=self.scoreTree.yview)
        self.scrollbar.pack(side='right', fill='y')
        self.scoreTree.configure(yscrollcommand=self.scrollbar.set)


# 管理员成绩管理界面
class ManageWindows(tk.Frame):
    def __init__(self, master=None, **kwargs):
        self.info = kwargs
        self.student = pd.read_excel('./data/Student-Account/student.xlsx')
        super().__init__(master)
        self.master = master
        self.pack(expand='no', fill='x')
        self.create_widgets()

    def create_widgets(self):
        # 1. 管理员信息
        # 第一行信息
        self.info1 = tk.Frame(self)
        self.info1.pack(side='top', expand='yes', fill='x', pady=10, padx=20)
        tk.Label(self.info1,
                 text='账号: {:20s}'.format(self.info['account']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')
        tk.Label(self.info1,
                 text='姓名: {:20s}'.format(self.info['name']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')

        # 第二行信息
        self.info2 = tk.Frame(self)
        self.info2.pack(side='top', expand='yes', fill='x', pady=0, padx=20)
        tk.Label(self.info2,
                 text='性别: {:26s}'.format(self.info['sex']),  # 对齐，中文长度和占的字节数和英文不同
                 font=("微软雅黑", 15, 'bold')).pack(side='left')
        tk.Label(self.info2,
                 text='职称: {:20s}'.format(self.info['profession']),
                 font=("微软雅黑", 15, 'bold')).pack(side='left')

        # 添加一行
        tk.Frame(self).pack(side='top', ipady=10, fill='x')

        # 2. 选择学生信息
        self.operateFrame = tk.Frame(self)
        self.operateFrame.pack(side='top', expand='yes', fill='x', padx=30)
        # 设置下拉列表
        self.list = ttk.Combobox(self.operateFrame, values=self.student['name'].to_list())
        self.list.pack(side='left')

        # 学生学号
        self.studentname = tk.Label(self.operateFrame,
                                    text='学生学号: {:15s}'.format(''),
                                    font=("微软雅黑", 10, 'bold'))
        self.studentname.pack(side='left', padx=20)
        # 查询
        self.checkButton = tk.Button(self.operateFrame, text='查询',
                                     width=15, command=self.check)
        self.checkButton.pack(side='right')
        # 修改
        self.changeButton = tk.Button(self.operateFrame, text='修改',
                                     width=15, command=self.change)
        self.changeButton.pack(side='right', padx=5)
        # 插入
        self.insertButton = tk.Button(self.operateFrame, text='插入',
                                     width=15, command=self.insert)
        self.insertButton.pack(side='right')

        # 添加一行
        tk.Frame(self).pack(side='top', ipady=10, fill='x')

        # 3. 成绩栏表格
        self.treeFrame = tk.Frame(self)
        self.treeFrame.pack(side='top', expand='yes', fill='x', padx=20)
        self.scoreTree = ttk.Treeview(self.treeFrame, show='headings')
        self.scoreTree.pack(side='left', expand='yes', fill='x')
        # 定义列
        self.scoreTree['columns'] = ['课程名称', '学期', '任课老师', '学分', '成绩']
        # 设置列宽度和列名
        for i in self.scoreTree['columns']:
            self.scoreTree.column(i, width=30)  # 设置宽度
            self.scoreTree.heading(i, text=i)  # 设置列名

        # 2.5 添加滚动条
        self.scrollbar = tk.Scrollbar(self.treeFrame, orient='vertical', command=self.scoreTree.yview)
        self.scrollbar.pack(side='right', fill='y')
        self.scoreTree.configure(yscrollcommand=self.scrollbar.set)


    def check(self):
        # 1. 清除表格
        exist_data = self.scoreTree.get_children()
        [self.scoreTree.delete(item) for item in exist_data]
        # 2. 显示数据
        studentName = self.list.get()
        index = np.where(self.student['name'] == studentName)[0][0]
        # 2.1 显示学生学号
        self.studentname['text'] = '学生学号: {:20s}'.format(self.student['account'][index])
        # 2.2 显示成绩
        file = './data/Student-score/{}.txt'.format(self.student['account'][index])
        with open(file, 'r', encoding='utf-8') as f:
            datas = f.readlines()
        for num, data in enumerate(datas):
            data = data.strip('\n').split(' ')
            self.scoreTree.insert('', num, values=data)

    def insert(self):
        print('insert')

    def change(self):
        print('change')








        







root = tk.Tk()
# root.resizable(False, False)
set_win_center(root, 400, 300)
d = {'account': 'M20201', 'password': 123456, 'name': '张三', 'sex': '男', 'profession': '教授'}
# app = ManageWindows(root, **d)
# set_win_center(root, 800, 600)
app = LoginWindows(root)
# app = StudentWindows(root)
# set_win_center(root, 800, 600)
app.mainloop()