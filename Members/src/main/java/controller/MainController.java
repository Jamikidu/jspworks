package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;

@WebServlet("*.do") // 경로를 .do로 끝나도록 설정
public class MainController extends HttpServlet {
   private static final long serialVersionUID = 4L;
   
   MemberDAO memberDAO; // DAO 객체 선언
   BoardDAO boardDAO;

   public void init(ServletConfig config) throws ServletException {
      memberDAO = new MemberDAO(); // DAO 객체 생성
      boardDAO = new BoardDAO();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //한글 인코딩
	  request.setCharacterEncoding("utf-8");
	  
	  //한글 컨텐츠 유형 응답
      response.setContentType("text/html; charset=utf-8");
      
      
      // command 패턴으로 url 설정하기
      String uri = request.getRequestURI();
      String command = uri.substring(uri.lastIndexOf('/'));
      
      System.out.println(uri);
      System.out.println();
      System.out.println(uri.lastIndexOf('/'));
      System.out.println("command: " + command);
      
      String nextPage = null;
      
      //출력 스트림 객체 생성
      PrintWriter out = response.getWriter();
      
      //세션 객체 생성
      HttpSession session = request.getSession();
      
      //회원 목록 조회
      if (command.equals("/memberList.do")) {
         ArrayList<Member> memberList = memberDAO.getMemberList();
            
            // 모델 생성 보내기
            request.setAttribute("memberList", memberList);
            
            nextPage = "/member/memberList.jsp";
      }else if(command.equals("/memberForm.do")) {
         
         nextPage = "/member/memberForm.jsp";
      }else if(command.equals("/addMember.do")) {
    	  //폼에 입력된 데이터 받기
    	  String memberId = request.getParameter("memberId");
    	  String passwd = request.getParameter("passwd1");
    	  String name = request.getParameter("name");
    	  String gender = request.getParameter("gender");
    	  
    	  Member newMember = new Member();	//회원 객체 생성
    	  newMember.setMemberId(memberId);
    	  newMember.setPasswd(passwd);
    	  newMember.setName(name);
    	  newMember.setGender(gender);
    	  
    	  memberDAO.addMember(newMember);	//회원 매개로 DB에 저장
    	  session.setAttribute("sessionId", memberId);	//회원가입에 성공하면 자동으로 세션발급
    	  nextPage = "/index.jsp";
      }else if(command.equals("/memberView.do")) {	//회원 정보 요청
    	  
    	  //memberId 받기
    	  String memberId = request.getParameter("memberId");
    	  
    	  Member member = memberDAO.getMember(memberId);
    	  
    	  request.setAttribute("member", member);	//member 모델 생성
    	  
    	  nextPage = "/member/memberView.jsp";
      }else if(command.equals("/loginForm.do")) {	//로그인 페이지 요청
    	  nextPage = "/member/loginForm.jsp";
      }else if(command.equals("/loginProcess.do")) {//로그인 체크 요청
    	  
    	  //로그인 폼에 입력된 데이터 받아오기
    	  String memberId = request.getParameter("memberId");
    	  String passwd = request.getParameter("passwd");
    	  
    	  Member loginMember = new Member();
    	  loginMember.setMemberId(memberId);
    	  loginMember.setPasswd(passwd);
    	  
    	  //로그인 체크 처리
    	  boolean result = memberDAO.checkLogin(loginMember);
    	  if(result) {
    		  //세션 발급
    		  session.setAttribute("sessionId", memberId);
    		  nextPage = "/index.jsp";
    		  
    	  }else {
    		  //2가지 방법, alert(), errormsg 보내기(모델)
    		  out.println("<script>");
    		  out.println("alert('아이디와 비밀번호를 확인해주세요')");
    		  out.println("history.go(-1)");	//이전 페이지로 이동
    		  out.println("</script>");
    	  }
    	  
      }else if(command.equals("/logout.do")) {	//로그아웃 요청
    	  //세션 모두 삭제(해제)
    	  session.invalidate();
    	  nextPage = "/index.jsp";
      }else if(command.equals("/deleteMember.do")) {	//회원 삭제 요청
    	  String memberId = request.getParameter("memberId");
    	  memberDAO.deleteMember(memberId);	//회원 삭제 처리
    	  nextPage = "/memberList.do";
      }
      //추첨사이트로 이동
      else if(command.equals("/memberEvent.do")) {
    	  
    	  nextPage = "/member/memberEvent.jsp";
      }
      
      //게시판 관리
      if(command.equals("/boardList.do")) {
    	  ArrayList<Board> boardList = boardDAO.getBoardList();
    	  
    	  //모델 생성
    	  request.setAttribute("boardList", boardList);
    	  
    	  nextPage = "/board/boardList.jsp";
      }else if(command.equals("/boardForm.do")) {
    	  
    	  nextPage = "/board/boardForm.jsp";
      }else if(command.equals("/addBoard.do")) {
    	  
    	  String realFolder = "C:/Users/Administrator/git/jspworks/Members/src/main/webapp/board/upload";
    	  
    	  MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
    	  
    	  //글쓰기 폼에 입력된 데이터 받아오기(request는 사용하지 않고 multi를 사용함)
    	  String title = multi.getParameter("title");
    	  String content = multi.getParameter("content");
    	  
    	  //memberId 세션을 가져오기
    	  String memberId = (String)session.getAttribute("sessionId");
    	  
    	  //fileName 속성 가져오기
    	  Enumeration<String> files = multi.getFileNames();
    	  String name = "";
    	  String fileName = "";
    	  if(files.hasMoreElements()) {
    		  name = (String)files.nextElement();
    		  fileName = multi.getFilesystemName(name);	//서버에 저장될 파일이름
    	  }
    	  
    	  
    	  Board newBoard = new Board();
    	  newBoard.setTitle(title);
    	  newBoard.setContent(content);
    	  newBoard.setMemberId(memberId);
    	  newBoard.setFileUpload(fileName);
    	  
    	  
    	  //글쓰기 처리 메서드 호출
    	  boardDAO.addBoard(newBoard);
    	  
      }else if(command.equals("/boardView.do")) {
    	  int bnum = Integer.parseInt(request.getParameter("bnum"));
    	  Board board = boardDAO.getBoard(bnum);	//글 상세보기 처리
    	  
    	  //모델 생성
    	  request.setAttribute("board", board);
    	  
    	  nextPage = "/board/boardView.jsp";
      }else if(command.equals("/deleteBoard.do")) {
    	  int bnum = Integer.parseInt(request.getParameter("bnum"));
    	  boardDAO.deleteBoard(bnum);
    	  
    	  nextPage = "/boardList.do";	//삭제 후 게시글 목록 이동
      }else if(command.equals("/updateBoard.do")) {
    	  int bnum = Integer.parseInt(request.getParameter("bnum"));
    	  
    	  Board board = boardDAO.getBoard(bnum);	//게시글 상세 보기(수정 눌렀을때 데이터가 따라옴)
    	  
    	  request.setAttribute("board", board);
    	  
    	  nextPage = "/board/updateBoard.jsp";
      }else if(command.equals("/updateProcess.do")) {
    	  //수정 폼에서 입력 내용 받기
    	  int bnum = Integer.parseInt(request.getParameter("bnum"));
    	  String title = request.getParameter("title");
    	  String content = request.getParameter("content");
    	  
    	  Board updateBoard = new Board();
    	  updateBoard.setTitle(title);
    	  updateBoard.setContent(content);
    	  updateBoard.setBnum(bnum);
    	  
    	  boardDAO.updateBoard(updateBoard);	//수정처리
    	  nextPage = "/boardList.do";
      }
      
      
      // 포워딩
      if(command.equals("/addBoard.do")) {
    	  response.sendRedirect("boardList.do");
      }
      else {
    	  RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
          
          dispatcher.forward(request, response);
      }
      
      
            
      
   }

}
