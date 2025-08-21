package mvc.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import mvc.model.*;

public class BoardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String cmd = req.getServletPath();       
        BoardDAO dao = BoardDAO.getInstance();

        switch (cmd) {
            
            case "/BoardListAction.do" -> {
                List<BoardDTO> list = dao.getBoardList();
                req.setAttribute("boardList", list);
                forward(req, res, "/board/list.jsp");
            }

        
            case "/BoardWriteForm.do" -> forward(req, res, "/board/writeForm.jsp");

       
            case "/BoardWriteAction.do" -> {
                BoardDTO b = new BoardDTO();
                b.setId(req.getParameter("id"));
                b.setName(req.getParameter("name"));
                b.setSubject(req.getParameter("subject"));
                b.setContent(req.getParameter("content"));
                dao.insertBoard(b);
                res.sendRedirect("BoardListAction.do");
            }

       
            case "/BoardViewAction.do" -> {
                int num = Integer.parseInt(req.getParameter("num"));
                BoardDTO dto = dao.getBoardByNum(num);
                req.setAttribute("board", dto);
                forward(req, res, "/board/view.jsp");
            }

         
            case "/BoardUpdateForm.do" -> {
                int num = Integer.parseInt(req.getParameter("num"));
                BoardDTO dto = dao.getBoardByNum(num);   // hit 상승 방지 원하면 DAO에 별도 메서드 사용
                req.setAttribute("board", dto);
                forward(req, res, "/board/updateForm.jsp");
            }

      
            case "/BoardUpdateAction.do" -> {
                BoardDTO b = new BoardDTO();
                b.setNum(Integer.parseInt(req.getParameter("num")));
                b.setName(req.getParameter("name"));
                b.setSubject(req.getParameter("subject"));
                b.setContent(req.getParameter("content"));
                dao.updateBoard(b);
                res.sendRedirect("BoardViewAction.do?num=" + b.getNum());
            }

        
            case "/BoardDeleteAction.do" -> {
                int num = Integer.parseInt(req.getParameter("num"));
                dao.deleteBoard(num);
                res.sendRedirect("BoardListAction.do");
            }

            default -> res.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }

    private void forward(HttpServletRequest req, HttpServletResponse res, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher(path);
        rd.forward(req, res);
    }
}
