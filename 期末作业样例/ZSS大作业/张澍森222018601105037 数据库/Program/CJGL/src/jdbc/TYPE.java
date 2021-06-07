package jdbc;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;


public class TYPE extends JFrame {
	public TYPE() {
		this.setTitle("选择操作类型");
		this.setBounds(500, 300, 400, 100);
		this.setLayout(new FlowLayout());
		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		JLabel operation = new JLabel("请选择您要执行的操作：");
		String zscgchoices[] = new String[] { "添加数据", "删除数据", "查找数据", "更改数据" };
		JComboBox zscg = new JComboBox(zscgchoices);
		JButton confirm=new JButton("确认");
		confirm.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent e) {
				int selected= zscg.getSelectedIndex();
				switch(selected) {
				case 0: new ADD();dispose();break;
				case 1:new DELETE();dispose();break;
				case 2:new SEARCH();dispose();break;
				case 3:new ALTER();dispose();break;
				}
				}});
			
		this.add(operation);
		this.add(zscg);
		this.add(confirm);
		this.setVisible(true);
		this.setResizable(true);
	}

}
