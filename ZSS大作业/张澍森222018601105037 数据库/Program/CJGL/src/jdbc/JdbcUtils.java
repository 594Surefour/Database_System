package jdbc;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

public class JdbcUtils {

// 表示定义数据库的用户名
	private final String username = "sa";
// 定义数据库的密码
	private final String password = "123456789";
// 定义数据库的驱动信息
	private final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
// 定义访问数据库的地址
	private final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=XJGL";
// 定义数据库的链接
	private Connection connection;
// 定义sql语句的执行对象
	private PreparedStatement pstmt;
// 定义查询返回的结果集合
	private ResultSet resultSet;
// 实现批处理操作的功能
	private Statement stmt;

	public JdbcUtils() {
		try {
			Class.forName(DRIVER);
//			System.out.println("注册驱动成功!!");
		} catch (Exception e) {
			System.out.println("注册驱动失败!!");
		}
	}

// 定义获得数据库的链接
	public Connection getConnection() {
		try {
			connection = DriverManager.getConnection(URL, username, password);
//			System.out.println("数据库连接成功!!");
		} catch (Exception e) {
			System.out.println("数据库连接失败!!");
// TODO: handle exception
		}
		return connection;
	}

	public boolean deleteByBatch(String[] sql) throws SQLException {
		boolean flag = false;
		stmt = connection.createStatement();
		if (sql != null) {
			for (int i = 0; i < sql.length; i++) {
				stmt.addBatch(sql[i]);
			}
		}
		int[] count = stmt.executeBatch();
		if (count != null) {
			flag = true;
		}
		return flag;
	}

	public boolean updateByPreparedStatement(String sql, List params) throws SQLException {
		boolean flag = false;
		int result = -1;// 表示当用户执行添加删除和修改的时候所影响数据库的行数
		pstmt = connection.prepareStatement(sql);
		int index = 1;
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		result = pstmt.executeUpdate();
		flag = result > 0 ? true : false;
		return flag;
	}

	/* 查询返回单条记录 */

	public Map<String, Object> findSimpleResult(String sql, List params) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();// 返回查询结果
		ResultSetMetaData metaData = resultSet.getMetaData();
		int col_len = metaData.getColumnCount();// 获得列的名称
		while (resultSet.next()) {
			for (int i = 0; i < col_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
		}
		return map;
	}

	public List<Map<String, Object>> findMoreResult(String sql, List params) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
			list.add(map);
		}
		return list;
	}

// jdbc的封装：
	public <T> T findSimpleRefResult(String sql, List params, Class cls) throws Exception {
		T resultObject = null;
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
// 创建实例
			resultObject = (T) cls.newInstance();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true);// 打开javabean的访问private权限
				field.set(resultObject, cols_value);
			}
		}
		return resultObject;
	}


	public <T> List findMoreRefResult(String sql, List params, Class cls) throws Exception {
		List list = new ArrayList();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			T resultObject = (T) cls.newInstance();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true);
				field.set(resultObject, cols_value);
			}
			list.add(resultObject);
		}
		return list;
	}

	public void releaseConn() {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
