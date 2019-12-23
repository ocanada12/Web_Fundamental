package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.acorn.util.ConnLocator;

public class MemberDao {
	private static MemberDao single;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (single == null) {
			single = new MemberDao();
		}
		return single;
	}

	public boolean isEmail(String email) {
		boolean isSuccess = false;
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					con = ConnLocator.getConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("SELECT m_email ");
					sql.append("FROM member ");
					sql.append("WHERE m_email = ?");
					pstmt = con.prepareStatement(sql.toString());
					int index = 0;
					pstmt.setString(++index, email);
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						index = 0;
						
						index = 0;
						isSuccess = true;
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (con != null)
							con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return isSuccess;
	}

}
