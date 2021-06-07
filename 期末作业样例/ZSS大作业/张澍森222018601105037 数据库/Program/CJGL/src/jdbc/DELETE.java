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

public class DELETE extends JFrame {
	JScrollPane scp;

	public DELETE() {
		JdbcUtils jdbc = new JdbcUtils();

		Connection conn = jdbc.getConnection();

		this.setTitle("删除数据");
		this.setBounds(500, 300, 400, 300);
		this.setLayout(new GridLayout(5, 1));
		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = (JPanel) this.getContentPane();
		JLabel deletetype = new JLabel("请选择所要删除的内容：");
		String[] deletechoices = new String[] { "学生信息", "学生成绩", "奖惩信息" };
		JComboBox delete = new JComboBox(deletechoices);
		JPanel deletep1=new JPanel();
		deletep1.add(deletetype);
		deletep1.add(delete);
		JLabel key = new JLabel("目标关键字（学号/课程名/奖惩序号）：");
		JTextField enterkey = new JTextField();
		JPanel deletep2=new JPanel();
		enterkey.setPreferredSize(new Dimension(150,20));
		deletep2.add(key);
		deletep2.add(enterkey);
		String[] basictitle = { "学号", "姓名", "生日", "入学日期", "性别", "电话", "班级", "学院", "专业" };
		String[] ebasictitle = { "SID", "SName", "Birth", "Enday", "Gender", "Tele", "Class", "Academy", "Major" };
		String[] gradetitle = { "学号", "姓名", "课程名", "成绩" };
		String[] egradetitle = { "SID", "SName", "Course", "Grade" };
		String[] coursetitle = { "学号", "姓名", "成绩" };
		String[] ecoursetitle = { "SID", "SName", "Grade" };
		String[] rptitle = { "序号", "学号", "姓名", "奖惩日期", "奖惩类型", "原因", "程度" };
		String[] erptitle = { "RPID", "SID", "SName", "RPDay", "Type", "Reason", "Degree" };
		JButton confirm1 = new JButton("确认查找");
		JButton confirm2 = new JButton("确认删除");
		JPanel buttonp1=new JPanel();
		JPanel buttonp2=new JPanel();
		confirm1.setPreferredSize(new Dimension(100,30));
		confirm2.setPreferredSize(new Dimension(100,30));
		buttonp1.add(confirm1);
		buttonp2.add(confirm2);
		confirm2.setVisible(false);

		confirm1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				confirm2.setVisible(true);

				int selected = delete.getSelectedIndex();
				switch (selected) {
				case 0:
					try {
						String gsid = enterkey.getText();
						String sql = "select * from Student";
						PreparedStatement pstm = conn.prepareStatement(sql);

						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while (rs.next()) {
							count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while (rs.next()) {
							for (int i = 0; i < basictitle.length; i++) {
								info[count][i] = rs.getString(ebasictitle[i]);
							}
							count++;
						}
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								String gkey = enterkey.getText();
								String sql = "delete from Student where SID=?";
								PreparedStatement pstm;
								try {
									pstm = conn.prepareStatement(sql);
									pstm.setString(1, gkey);
									pstm.executeUpdate();
									JOptionPane.showMessageDialog(null, "删除成功", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn = jdbc.getConnection();

									dispose();
									new TYPE();
								} catch (SQLException e1) {
									JOptionPane.showMessageDialog(null, "删除失败", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									e1.printStackTrace();
								}

							}
						});
						scp.getViewport().add(new JTable(info, basictitle));
					} catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				case 1:
					try {
						String gsid = enterkey.getText();
						String sql = "select s.SID,s.SName,c.Course,c.Grade from Student s,Grade c where s.SID=c.SID";
						PreparedStatement pstm = conn.prepareStatement(sql);

						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while (rs.next()) {
							count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while (rs.next()) {
							for (int i = 0; i < gradetitle.length; i++) {
								info[count][i] = rs.getString(egradetitle[i]);
							}
							count++;
						}
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								String gkey = enterkey.getText();
								String sql = "delete from Grade where Course=?";
								PreparedStatement pstm;
								try {
									pstm = conn.prepareStatement(sql);
									pstm.setString(1, gkey);
									pstm.executeUpdate();
									JOptionPane.showMessageDialog(null, "删除成功", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn = jdbc.getConnection();

									dispose();
									new TYPE();
								} catch (SQLException e1) {
									JOptionPane.showMessageDialog(null, "删除失败", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									e1.printStackTrace();
								}

							}
						});
						scp.getViewport().add(new JTable(info, gradetitle));
					} catch (Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;

				case 2:
					try {
						String gkey = enterkey.getText();
						String sql = "select r.*,s.SName from Student s,RP r where s.SID=r.SID";
						PreparedStatement pstm = conn.prepareStatement(sql);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while (rs.next()) {
							count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while (rs.next()) {
							for (int i = 0; i < rptitle.length; i++) {
								info[count][i] = rs.getString(erptitle[i]);
							}
							count++;
						}
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								String gkey = enterkey.getText();
								String sql = "delete from RP where RPID=?";
								PreparedStatement pstm;
								try {
									pstm = conn.prepareStatement(sql);
									pstm.setString(1, gkey);
									pstm.executeUpdate();
									JOptionPane.showMessageDialog(null, "删除成功", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn = jdbc.getConnection();

									dispose();
									new TYPE();
								} catch (SQLException e1) {
									JOptionPane.showMessageDialog(null, "删除失败", "消息提示",
											JOptionPane.INFORMATION_MESSAGE);
									e1.printStackTrace();
								}

							}
						});
						scp.getViewport().add(new JTable(info, rptitle));
					} catch (Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
				}
			}
		});

		this.add(deletep1);
		this.add(buttonp1);
		this.scp = new JScrollPane();
		this.add(scp);
		this.add(deletep2);
		this.add(buttonp2);
		this.setVisible(true);
		this.setResizable(true);

	}

}
