package mvjsp.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvjsp.board.model.Board;
import mvjsp.jdbc.JdbcUtil;

public class BoardDao {
    private static BoardDao dao = new BoardDao();

    private BoardDao() {
    } // 생성자

    public static BoardDao getInstance() {
        return dao;
    }

    public ArrayList<Board> selectList(Connection conn) {
        ArrayList<Board> list = new ArrayList<Board>();
        String sql = "select * from board order by num desc";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Board board = new Board(rs.getInt("num"), rs.getString("writer"), rs.getString("title"),
                        rs.getString("content"), rs.getString("regtime"), rs.getInt("hits"));
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs, pstmt, conn);
        }
        return list;
    }

    public Board selectOne(Connection conn, int num, boolean inc) {
        Board board = null;
        String sql = "select * from board where num = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                board = new Board(rs.getInt("num"), rs.getString("writer"), rs.getString("title"),
                        rs.getString("content"), rs.getString("regtime"), rs.getInt("hits"));
            }
            // hits 수 올리기
            if (inc) {
                pstmt.executeUpdate("update board set hits=hits+1 where num=" + num);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs, pstmt, conn);
        }
        return board;
    }

    public int delete(Connection conn, int num, String memberId) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("delete from board where num=? and writer=?");
            pstmt.setInt(1, num);
            pstmt.setString(2, memberId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(null, pstmt, conn);
        }
        return 0;
    }

    public int insert(Connection conn, Board board) {
        String sql = "insert into board(num, title, writer, content, regtime, hits) values (SEQ_BOARD.nextval, ?, ?, ?, SYSDATE, 0)";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getWriter());
            pstmt.setString(3, board.getContent());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(null, pstmt, conn);
        }
        return 0;
    }

    public int update(Connection conn, Board board) {
        String sql = "update board set writer=?, title=?, content=?, regtime=sysdate where num=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getWriter());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setInt(4, board.getNum());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(null, pstmt, conn);
        }
        return 0;
    }
}
