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

import javax.swing.*;
import javax.swing.table.JTableHeader;

public class ALTER extends JFrame {
	JScrollPane scp;

	public ALTER() {
		JdbcUtils jdbc = new JdbcUtils();
		Connection conn = jdbc.getConnection();
		this.setTitle("更改数据");
		this.setBounds(500, 300, 550, 280);
		this.setLayout(new GridLayout(6, 1));
		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = (JPanel) this.getContentPane();
		JLabel altertype = new JLabel("请选择所要更改的内容：");
		String[] alterchoices = new String[] { "学生基本信息", "学生成绩", "课程成绩", "奖惩信息" };
		JComboBox alter = new JComboBox(alterchoices);
		JPanel alterp1=new JPanel();
		alterp1.add(altertype);
		alterp1.add(alter);
		JLabel alteritem = new JLabel("请更改内容，其他保持不变",JLabel.CENTER);
		JLabel key = new JLabel("目标关键字（学号/课程名）：");
		JPanel alterp2=new JPanel();
		JTextField enterkey = new JTextField();
		enterkey.setPreferredSize(new Dimension(150,20));
		alterp2.add(key);
		alterp2.add(enterkey);
		String[] basictitle = { "学号", "姓名", "生日", "入学日期", "性别", "电话", "班级", "学院", "专业" };
		String[] ebasictitle = { "SID", "SName", "Birth", "Enday", "Gender", "Tele", "Class", "Academy", "Major" };
		
		String[] gradetitle = { "学号", "姓名", "课程名", "成绩" };
		String[] egradetitle= {"SID","SName","Course","Grade"};
		String[] coursetitle = { "学号", "姓名", "成绩" };
		String[] ecoursetitle= {"SID","SName","Grade"};
		String[] rptitle = { "序号","学号", "姓名", "奖惩日期", "奖惩类型", "原因", "程度" };
		String[] erptitle= {"RPID","SID","SName","RPDay","Type","Reason","Degree"};
		Object[][] info = new Object[1][20];
		JButton confirm1 = new JButton("确认");
		JPanel buttonp1=new JPanel();
		JPanel buttonp2=new JPanel();
		JButton confirm2 = new JButton("确认更改");
		confirm1.setPreferredSize(new Dimension(70,30));
		confirm2.setPreferredSize(new Dimension(100,30));
		buttonp1.add(confirm1);
		buttonp2.add(confirm2);
		confirm1.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent e) {
				int selected= alter.getSelectedIndex();
				alteritem.setVisible(true);
				switch(selected) {
				case 0: 
				try {
					String gsid=enterkey.getText();
					String sql= "select * from Student where SID=?"; 
					PreparedStatement pstm = conn.prepareStatement(sql);
					pstm.setString(1, gsid);
					ResultSet rs = pstm.executeQuery();
					int count = 0;
					while(rs.next()){
					count++;
					}
					rs = pstm.executeQuery();
					Object[][] info = new Object[count][20];
					String[][] info1=new String[count][20];
					String[][] info2=new String[count][20];
					count = 0;
					while(rs.next()){
						for (int i=0;i<basictitle.length;i++) {
							info[count][i]=rs.getString(ebasictitle[i]);
						}
						count++;
				     }
					for (int i=0;i<count;i++) {
						for (int j=0;j<20;j++) {
							info1[i][j]=String.valueOf(info[i][j]);
						}
					}
					scp.getViewport().add(new JTable(info, basictitle));
					confirm2.setVisible(true);
					confirm2.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							for (int i=0;i<info.length;i++) {
								for (int j=0;j<20;j++) {
									info2[i][j]=String.valueOf(info[i][j]);
								}
							}
							for (int i=0;i<info.length;i++) {
								for (int j=0;j<20;j++) {
									if(info2[i][j]!=info1[i][j]) {
									    String sql="update Student  set "+ebasictitle[j]+"=? where SID=? ";
								
									    PreparedStatement pstm;
									    try {
										    pstm = conn.prepareStatement(sql);
										    pstm.setString(1, info2[i][j]);
										    pstm.setString(2,gsid);
										    pstm.executeUpdate();
									    } catch (SQLException e1) {
									    	JOptionPane.showMessageDialog(null, "更改失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
									    	e1.printStackTrace();
									     }
									
									}
								}
							}
							 JOptionPane.showMessageDialog(null, "更改成功", "消息提示", JOptionPane.INFORMATION_MESSAGE);
								try {
									conn.close();
								} catch (SQLException e2) {
									e2.printStackTrace();
								}
								JdbcUtils jdbc = new JdbcUtils();
								Connection conn=jdbc.getConnection();
								
							 dispose();new TYPE();
						}
						
					});
				}catch(Exception e1) {
					e1.printStackTrace();
					JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
				}
				break;
				case 1:
					try {
						String gsid=enterkey.getText();
						String sql= "select s.SID,s.SName,g.Course,g.Grade from Student s,Grade g where s.SID=? and s.SID=g.SID"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gsid);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						String[][] info1=new String[count][20];
						String[][] info2=new String[count][20];
						count = 0;
						while(rs.next()){
							for (int i=0;i<gradetitle.length;i++) {
								info[count][i]=rs.getString(egradetitle[i]);
							}
							count++;
					     }
						for (int i=0;i<count;i++) {
							for (int j=0;j<20;j++) {
								info1[i][j]=String.valueOf(info[i][j]);
							}
						}
						scp.getViewport().add(new JTable(info, gradetitle));
						confirm2.setVisible(true);
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										info2[i][j]=String.valueOf(info[i][j]);
									}
								}
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										if(info2[i][j]!=info1[i][j]) {
										    String sql="update Grade  set "+egradetitle[j]+"=? where SID=? and Course=?";
										    PreparedStatement pstm;
										    try {
											    pstm = conn.prepareStatement(sql);
											    pstm.setString(1, info2[i][j]);
											    pstm.setString(2,gsid);
											    pstm.setString(3, info2[i][2]);
											    pstm.executeUpdate();
										    } catch (SQLException e1) {
										    	JOptionPane.showMessageDialog(null, "更改失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
										    	e1.printStackTrace();
										     }
										
										}
									}
								}
								 JOptionPane.showMessageDialog(null, "更改成功", "消息提示", JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn=jdbc.getConnection();
									
								 dispose();new TYPE();
							}
							
						});
					}catch(Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				case 2:
					try {
						String gkey=enterkey.getText();
						String sql= "select s.SID,s.SName,g.Grade from Student s,Grade g where g.Course=? and s.SID=g.SID"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gkey);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						String[][] info1=new String[count][20];
						String[][] info2=new String[count][20];
						count = 0;
						while(rs.next()){
							for (int i=0;i<coursetitle.length;i++) {
								info[count][i]=rs.getString(ecoursetitle[i]);
							}
							count++;
					     }
						for (int i=0;i<count;i++) {
							for (int j=0;j<20;j++) {
								info1[i][j]=String.valueOf(info[i][j]);
							}
						}
						scp.getViewport().add(new JTable(info, coursetitle));
						confirm2.setVisible(true);
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										info2[i][j]=String.valueOf(info[i][j]);
									}
								}
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										if(info2[i][j]!=info1[i][j]) {
										    String sql="update Grade  set "+ecoursetitle[j]+"=? where SID=? and Course=?";
										    PreparedStatement pstm;
										    try {
											    pstm = conn.prepareStatement(sql);
											    pstm.setString(1, info2[i][j]);
											    pstm.setString(2,info2[i][0]);
											    pstm.setString(3, gkey);
											    pstm.executeUpdate();
										    } catch (SQLException e1) {
										    	JOptionPane.showMessageDialog(null, "更改失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
										    	e1.printStackTrace();
										     }
										
										}
									}
								}
								 JOptionPane.showMessageDialog(null, "更改成功", "消息提示", JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn=jdbc.getConnection();
									
								 dispose();new TYPE();
							}
							
						});
					}catch(Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				
				case 3:
					try {
						String gkey=enterkey.getText();
						String sql= "select r.*,s.SName from Student s,RP r where r.SID=? and s.SID=r.SID"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gkey);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						String[][] info1=new String[count][20];
						String[][] info2=new String[count][20];
						count = 0;
						while(rs.next()){
							for (int i=0;i<rptitle.length;i++) {
								info[count][i]=rs.getString(erptitle[i]);
							}
							count++;
					     }
						for (int i=0;i<count;i++) {
							for (int j=0;j<20;j++) {
								info1[i][j]=String.valueOf(info[i][j]);
							}
						}
						scp.getViewport().add(new JTable(info, rptitle));
						confirm2.setVisible(true);
						confirm2.addActionListener(new ActionListener() {
							public void actionPerformed(ActionEvent e) {
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										info2[i][j]=String.valueOf(info[i][j]);
									}
								}
								for (int i=0;i<info.length;i++) {
									for (int j=0;j<20;j++) {
										if(info2[i][j]!=info1[i][j]) {
										    String sql="update RP  set "+erptitle[j]+"=? where SID=? and RPID=?";
									
										    PreparedStatement pstm;
										    try {
											    pstm = conn.prepareStatement(sql);
											    pstm.setString(1, info2[i][j]);
											    pstm.setString(2,gkey);
											    pstm.setString(3,info2[i][0]);
											    pstm.executeUpdate();
										    } catch (SQLException e1) {
										    	JOptionPane.showMessageDialog(null, "更改失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
										    	e1.printStackTrace();
										     }
										
										}
									}
								}
								 JOptionPane.showMessageDialog(null, "更改成功", "消息提示", JOptionPane.INFORMATION_MESSAGE);
									try {
										conn.close();
									} catch (SQLException e2) {
										e2.printStackTrace();
									}
									JdbcUtils jdbc = new JdbcUtils();
									Connection conn=jdbc.getConnection();
									
								 dispose();new TYPE();
							}
							
						});
					}catch(Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
				
				}
				}});
		

		this.add(alterp1);
		this.add(alterp2);
	
		this.add(buttonp1);
		this.add(alteritem);
		alteritem.setVisible(false);
		this.scp = new JScrollPane();
		this.add(scp);
		this.add(buttonp2);
		confirm2.setVisible(false);
		this.setVisible(true);
		this.setResizable(true);

	}

}
