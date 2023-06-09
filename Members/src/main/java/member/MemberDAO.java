package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class MemberDAO {
   // 필드
   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   
   //회원가입
   public void addMember(Member member) {
	   conn = JDBCUtil.getConnection();
	   String sql = "INSERT INTO t_member(memberid, passwd, name, gender) "
	   		+ "VALUES (?, ?, ?, ?)";
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getPasswd());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getGender());
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JDBCUtil.close(conn, pstmt);
	}
   }
   
   // 회원목록
   public ArrayList<Member> getMemberList () {
      ArrayList<Member> memberList = new ArrayList<>();
      conn = JDBCUtil.getConnection();
      String sql = "select * from t_member order by joinDate desc";
      try {
         pstmt = conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         while (rs.next()) {
            Member member = new Member();
            member.setMemberId(rs.getString("memberid"));
            member.setPasswd(rs.getString("passwd"));
            member.setName(rs.getString("name"));
            member.setGender(rs.getString("gender"));
            member.setJoinDate(rs.getDate("joinDate"));
            
            memberList.add(member);
            
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         JDBCUtil.close(conn, pstmt, rs);
      }
      
      
      return memberList;
   }
   
   
}
