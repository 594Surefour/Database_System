package jdbc;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.swing.*;
import javax.swing.table.JTableHeader;

public class ADD extends JFrame {
	JScrollPane scp;

	public ADD() {
		JdbcUtils jdbc = new JdbcUtils();
		Connection conn=jdbc.getConnection();
		this.setTitle("增添数据");
		this.setBounds(500, 300, 400, 200);
		this.setLayout(new GridLayout(4, 1));
		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = (JPanel) this.getContentPane();
		JLabel addtype = new JLabel("请选择所要添加的内容：");
		String[] addchoices = new String[] { "学生基本信息", "学生成绩", "奖惩信息" };
	
		JComboBox add = new JComboBox(addchoices);
		JPanel addp=new JPanel();
		addp.add(addtype);
		addp.add(add);
		Object[][] info = new Object[1][20];
		String[] basictitle = { "学号", "姓名", "生日", "入学日期", "性别", "电话", "班级", "学院", "专业" };
		String[] gradetitle = { "学号", "课程名", "成绩" };
		String[] rptitle = { "编号","学号", "奖惩日期", "奖惩类型", "原因", "程度" };
		JButton confirm1 = new JButton("确认选择");
		JPanel buttonp1=new JPanel();
		JPanel buttonp2=new JPanel();
		JButton confirm2 = new JButton("确认添加");
		buttonp1.add(confirm1);
		confirm1.setPreferredSize(new Dimension(100,30));
		buttonp2.add(confirm2);
		confirm2.setPreferredSize(new Dimension(100,30));
		confirm1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				int addselected = add.getSelectedIndex();
				switch (addselected) {
				case 0:
					scp.getViewport().add(new JTable(info, basictitle));
					confirm2.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							try {
								List<Object> lists = new ArrayList<Object>();
								 for(int i=0;i<basictitle.length;i++) {
						            	lists.add(String.valueOf(info[0][i]));
						            }
								if (jdbc.updateByPreparedStatement("insert into Student  values (?,?,?,?,?,?,?,?,?)",
										lists))
									JOptionPane.showMessageDialog(null, "添加成功！", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
								try {
									conn.close();
								} catch (SQLException e2) {
									e2.printStackTrace();
								}
								JdbcUtils jdbc = new JdbcUtils();
								Connection conn=jdbc.getConnection();
								
								dispose();
								new TYPE();
							} catch (Exception e1) {
								e1.printStackTrace();
								JOptionPane.showMessageDialog(null, "添加失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
							}
						}
					});
					break;
				case 1:
					scp.getViewport().add(new JTable(info, gradetitle));
					confirm2.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							try {
								List<Object> lists = new ArrayList<Object>();
								for(int i=0;i<gradetitle.length;i++) {
					            	lists.add(String.valueOf(info[0][i]));
					            }

								if (jdbc.updateByPreparedStatement("insert into Grade  values (?,?,?)", lists))
									JOptionPane.showMessageDialog(null, "添加成功！", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
								try {
									conn.close();
								} catch (SQLException e2) {
									e2.printStackTrace();
								}
								JdbcUtils jdbc = new JdbcUtils();
								Connection conn=jdbc.getConnection();
								
								dispose();
								new TYPE();
							} catch (SQLException e1) {
								JOptionPane.showMessageDialog(null, "添加失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
							}
						}
					});
					break;
				case 2:
					scp.getViewport().add(new JTable(info, rptitle));
					confirm2.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							try {
								List<Object> lists = new ArrayList<Object>();
								for(int i=0;i<rptitle.length;i++) {
					            	lists.add(String.valueOf(info[0][i]));
					            }
								if (jdbc.updateByPreparedStatement("insert into RP  values (?,?,?,?,?,?)", lists))
									JOptionPane.showMessageDialog(null, "添加成功！", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
								try {
									conn.close();
								} catch (SQLException e2) {
									e2.printStackTrace();
								}
								JdbcUtils jdbc = new JdbcUtils();
								Connection conn=jdbc.getConnection();
								
								dispose();
								new TYPE();
							} catch (SQLException e1) {
								e1.printStackTrace();
								JOptionPane.showMessageDialog(null, "添加失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
							}
						}
					});
					break;
				}
			}
		});
		this.add(addp);
	
		this.add(buttonp1);
		this.scp = new JScrollPane();
		this.add(scp);
		this.add(buttonp2);
		this.setVisible(true);
		this.setResizable(true);
	}
}
