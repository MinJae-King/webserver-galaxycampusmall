package mvc.model;

import java.sql.*;
import java.util.*;
import mvc.database.DBConnection;

public class BoardDAO {

    private BoardDAO() {}
    private static class Holder { static final BoardDAO INSTANCE = new BoardDAO(); }
    public  static BoardDAO getInstance() { return Holder.INSTANCE; }

 
    public List<BoardDTO> getBoardList() {
        List<BoardDTO> list = new ArrayList<>();
        String sql = "SELECT num,id,name,subject,regist_day,hit FROM board ORDER BY num DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BoardDTO d = new BoardDTO();
                d.setNum(rs.getInt("num"));
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setSubject(rs.getString("subject"));
                d.setRegist_day(rs.getString("regist_day"));
                d.setHit(rs.getInt("hit"));
                list.add(d);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

  
    public BoardDTO getBoardByNum(int num) {
        BoardDTO dto = null;
        String hitSql = "UPDATE board SET hit = hit+1 WHERE num=?";
        String selSql = "SELECT * FROM board WHERE num=?";
        try (Connection conn = DBConnection.getConnection()) {
            try (PreparedStatement ps = conn.prepareStatement(hitSql)) {
                ps.setInt(1, num);  ps.executeUpdate();
            }
            try (PreparedStatement ps = conn.prepareStatement(selSql)) {
                ps.setInt(1, num);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        dto = new BoardDTO();
                        dto.setNum(rs.getInt("num"));
                        dto.setId(rs.getString("id"));
                        dto.setName(rs.getString("name"));
                        dto.setSubject(rs.getString("subject"));
                        dto.setContent(rs.getString("content"));
                        dto.setRegist_day(rs.getString("regist_day"));
                        dto.setHit(rs.getInt("hit"));
                    }
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return dto;
    }


    public void insertBoard(BoardDTO b) {
        String sql = "INSERT INTO board(id,name,subject,content,regist_day,hit) " +
                     "VALUES(?,?,?,?,NOW(),0)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getId());
            ps.setString(2, b.getName());
            ps.setString(3, b.getSubject());
            ps.setString(4, b.getContent());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }


    public void updateBoard(BoardDTO b) {
        String sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getName());
            ps.setString(2, b.getSubject());
            ps.setString(3, b.getContent());
            ps.setInt(4, b.getNum());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }


    public void deleteBoard(int num) {
        String sql = "DELETE FROM board WHERE num=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, num);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
