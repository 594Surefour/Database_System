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
public class SEARCH extends JFrame{
	JScrollPane scp;
	public SEARCH() {
		JdbcUtils jdbc = new JdbcUtils();
		
		
		Connection conn=jdbc.getConnection();
		
		this.setTitle("查找数据");
		this.setBounds(500, 300, 400, 300);
		this.setLayout(new GridLayout(5, 1));
		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JPanel panel = (JPanel) this.getContentPane();
		JLabel searchtype = new JLabel("请选择所要查找的内容：");
		String[] searchchoices = new String[] { "学生信息", "学生成绩", "课程成绩","班级人数","奖惩信息" };
		JComboBox search = new JComboBox(searchchoices);
		JPanel searchp1=new JPanel();
		searchp1.add(searchtype);
		searchp1.add(search);
		JLabel key= new JLabel("目标关键字（学号/课程名/班号）：");
		JTextField enterkey=new JTextField();
		JPanel searchp2=new JPanel();
		enterkey.setPreferredSize(new Dimension(150,20));
		searchp2.add(key);
		searchp2.add(enterkey);
		String[] basictitle = { "学号", "姓名", "班级", "学院", "专业" };//视图SearchView
		String[] coursetitle= {"学号","姓名","成绩"};
		String[] gradetitle = { "学号", "姓名","课程名", "成绩" };
		String[] classtitle= {"班级","人数"};
		String[] rptitle = { "编号","学号","姓名", "奖惩日期", "奖惩类型", "原因", "程度" };
		JButton confirm1 = new JButton("确认查找");
		JButton back=new JButton("返  回");
		JPanel buttonp1=new JPanel();
		JPanel buttonp2=new JPanel();
		confirm1.setPreferredSize(new Dimension(100,30));
		back.setPreferredSize(new Dimension(70,30));
		buttonp1.add(confirm1);
		buttonp2.add(back);
		back.setVisible(false);
		back.addActionListener(new ActionListener() {
			public void actionPerformed (ActionEvent e) {
				
				dispose();
				new TYPE();
			}
		});
		confirm1.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent e) {
				back.setVisible(true);
				int selected= search.getSelectedIndex();
				switch(selected) {
				case 0: 
				try {
					String gsid=enterkey.getText();
					String sql= "select * from SearchView where SID=?"; 
					PreparedStatement pstm = conn.prepareStatement(sql);
					pstm.setString(1, gsid);
					ResultSet rs = pstm.executeQuery();
					int count = 0;
					while(rs.next()){
					count++;
					}
					rs = pstm.executeQuery();
					Object[][] info = new Object[count][20];
					count = 0;
					while(rs.next()){
						info[count][0] = rs.getString("SID");
						info[count][1] = rs.getString("SName");
						info[count][2] = rs.getString("Class");
						info[count][3] = rs.getString("Academy");
						info[count][4] = rs.getString("Major");
						count++;
						}
					scp.getViewport().add(new JTable(info, basictitle));
				}catch(Exception e1) {
					JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
				}
				break;
				case 1:
					try {
						String gsid=enterkey.getText();
						String sql= "select s.SID,s.SName,c.Course,c.Grade from Student s,Grade c where s.SID=? and s.SID=c.SID"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gsid);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while(rs.next()){
							info[count][0] = rs.getString("SID");
							info[count][1] = rs.getString("SName");
							info[count][2] = rs.getString("Course");
							info[count][3] = rs.getString("Grade");
							count++;
							}
						scp.getViewport().add(new JTable(info,gradetitle));
					}catch(Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				case 2:
					try {
						String gkey=enterkey.getText();
						String sql= "select s.SID,s.SName,c.Grade from Student s,Grade c where c.Course=? and s.SID=c.SID"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gkey);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while(rs.next()){
							info[count][0] = rs.getString("SID");
							info[count][1] = rs.getString("SName");
							info[count][2] = rs.getString("Grade");
							count++;
							}
						scp.getViewport().add(new JTable(info, coursetitle));
					}catch(Exception e1) {
		
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				case 3:
					try {
						String gkey=enterkey.getText();
						String sql= "select * from Class where Class=?"; 
						PreparedStatement pstm = conn.prepareStatement(sql);
						pstm.setString(1, gkey);
						ResultSet rs = pstm.executeQuery();
						int count = 0;
						while(rs.next()){
						count++;
						}
						rs = pstm.executeQuery();
						Object[][] info = new Object[count][20];
						count = 0;
						while(rs.next()){
							info[count][0] = rs.getString("Class");
							info[count][1] = rs.getString("SQ");
							count++;
							}
						scp.getViewport().add(new JTable(info,classtitle));
					}catch(Exception e1) {
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
					break;
				case 4:
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
						count = 0;
						while(rs.next()){
							info[count][0]=rs.getString("RPID");
							info[count][1] = rs.getString("SID");
							info[count][2] = rs.getString("SName");
							info[count][3] = rs.getString("RPday");
							info[count][4] = rs.getString("Type");
							info[count][5] = rs.getString("Reason");
							info[count][6] = rs.getString("Degree");
							count++;
							}
						scp.getViewport().add(new JTable(info, rptitle));
					}catch(Exception e1) {
						e1.printStackTrace();
						JOptionPane.showMessageDialog(null, "查找失败", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					}
				}
				}});
		
		
		this.add(searchp1);

		this.add(searchp2);
this.add(buttonp1);
		this.scp = new JScrollPane();
		this.add(scp);
this.add(buttonp2);
		this.setVisible(true);
		this.setResizable(true);
		
	}

}
