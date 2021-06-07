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

public class LOG extends JFrame {
	public LOG() {
		JdbcUtils jdbc = new JdbcUtils();
		jdbc.getConnection();
		List<Object> list = new ArrayList<Object>();
		String[] username = new String[1];
		String[] userpassword = new String[1];
		JPanel panel = (JPanel) this.getContentPane();
		this.setTitle("登陆");// 总框架
		this.setBounds(500, 300, 300, 300);
		panel.setLayout(new GridLayout(4, 1));
		JLabel Ltitle=new JLabel("学籍管理系统",JLabel.CENTER);
		Ltitle.setFont(new Font("Dialog",1,20));
		JLabel Lusername = new JLabel("用户名：",JLabel.CENTER);
		Lusername.setFont(new Font("Dialog",0,15));
		JTextField enterusername = new JTextField("请输入用户名",JTextField.CENTER);
		enterusername.setPreferredSize(new Dimension(150,20));
		JLabel Luserpassword = new JLabel("密    码：",JLabel.CENTER);
		Luserpassword.setFont(new Font("Dialog",0,15));
		JButton login = new JButton("登  录");
		JPanel log=new JPanel();
		log.add(login);
		login.setPreferredSize(new Dimension(70,40));
		JPasswordField enteruserpassword = new JPasswordField();
		enteruserpassword.setPreferredSize(new Dimension(150,20));
		JPanel user= new JPanel();
		JPanel pw=new JPanel();
		panel.add(Ltitle);
		user.add(Lusername); 
		user.add(enterusername);
		panel.add(user);
		pw.add(Luserpassword);
		pw.add(enteruserpassword);
		panel.add(pw);
		panel.add(log);
		enterusername.addMouseListener(new java.awt.event.MouseAdapter() {
			public void mouseClicked(java.awt.event.MouseEvent e) {
				enterusername.setText("");
			}
		});
		login.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				username[0] = enterusername.getText();
				userpassword[0] = String.valueOf(enteruserpassword.getPassword());
				list.add(username[0]);
				try {
					Map<String, Object> map = jdbc.findSimpleResult("select AdPW from Admin  where AdID=?", list);
					if (!userpassword[0].equals(map.toString().substring(6, 18).trim())) {
						JOptionPane.showMessageDialog(null, "密码错误！", "消息提示", JOptionPane.INFORMATION_MESSAGE);
						System.exit(0);
					} else {
						
						JOptionPane.showMessageDialog(null, "登陆成功！", "消息提示", JOptionPane.INFORMATION_MESSAGE);
						dispose();new TYPE();
					}
				} catch (Exception e1) {
					JOptionPane.showMessageDialog(null, "登陆失败！", "消息提示", JOptionPane.INFORMATION_MESSAGE);
					System.exit(0);
				}
			}
		});

		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setVisible(true);
		this.setResizable(true);
	}

	public static void main(String[] args) {
		new LOG();
	}
}
