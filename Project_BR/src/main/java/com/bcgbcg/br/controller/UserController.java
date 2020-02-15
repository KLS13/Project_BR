package com.bcgbcg.br.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.command.BoardCommand;
import com.bcgbcg.br.command.BooksByGradeCommand;
import com.bcgbcg.br.command.BooksByNumOfReviewCommand;
import com.bcgbcg.br.command.MailCommand;
import com.bcgbcg.br.command.UserChangePwCommand;
import com.bcgbcg.br.command.UserCommand;
import com.bcgbcg.br.command.UserDeleteCommand;
import com.bcgbcg.br.command.UserFindIdCommand;
import com.bcgbcg.br.command.UserJoincommand;
import com.bcgbcg.br.command.UserLoginCommand;
import com.bcgbcg.br.command.UserLogoutCommand;
import com.bcgbcg.br.command.UserModifyCommand;
import com.bcgbcg.br.dao.UserDao;
import com.bcgbcg.br.dto.UserDto;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class UserController {
	 
	private String referrer = "";
	private UserCommand userCommand;
	private BoardCommand boardCommand;
	private MailCommand mailCommand = null;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSession sqlSession;


	
	// Method
	
	@RequestMapping("join")
	public String Join(HttpServletRequest request ,Model model) {
		model.addAttribute("request", request);
		userCommand = new UserJoincommand();
		userCommand.execute(sqlSession, model);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		return "home";
	}

	@RequestMapping("login")
	public String logint(HttpServletRequest request, Model model, RedirectAttributes rda) {
		model.addAttribute("request", request);
		model.addAttribute("rda", rda);
		userCommand = new UserLoginCommand();
		userCommand.execute(sqlSession, model);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:"+referrer;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		userCommand = new UserLogoutCommand();
		userCommand.execute(sqlSession, model);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:home";
	}
	
	@RequestMapping("modify")
	public String modify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		userCommand = new UserModifyCommand();
		userCommand.execute(sqlSession, model);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:home";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		userCommand = new UserDeleteCommand();
		userCommand.execute(sqlSession, model);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		return "home";
	}
	@RequestMapping("idFind") // mapping 값 수정
	public String FindId(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		userCommand = new UserFindIdCommand();
		userCommand.execute(sqlSession, model);
		return "finds/idFindResult";
	}
	
	@RequestMapping("ChangePw")
	public String ChangePw(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		userCommand = new UserChangePwCommand();
		userCommand.execute(sqlSession, model);
		referrer = request.getHeader("Referer");
		return "redirect:home";
	}
	
	@RequestMapping(value = "idCheck", produces="application/json")
	@ResponseBody
	public String idCheck(@RequestParam("uId_") String uId_) {
		JSONObject obj = new JSONObject(); 
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		UserDto uDto = uDao.idCheck(uId_);
		
		if(uDto != null) {
			obj.put("RESULT", 0);
		}else {
			obj.put("RESULT", 1);
		}
		
		return obj.toJSONString(); 
	}
	
	
	// Email ajax 수정
		@SuppressWarnings("unchecked")
		@RequestMapping(value="searchPwByEmail", produces="application/json")
		@ResponseBody
		public String searchByEmail(HttpServletRequest request, Model model) {
			String uId_ = request.getParameter("uId_");
			String uName = request.getParameter("uName");
			UserDao uDao = sqlSession.getMapper(UserDao.class);
			UserDto uDto = uDao.searchUserInfo(uId_, uName);
			int authKey = 0;

			try {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setFrom("tester24512@gmail.com");
				message.setTo(uDto.getuEmail());
				message.setSubject("북리뷰 비밀번호 인증메일입니다");
				authKey = (int)(Math.random() * 1000000) + 1234567;
				message.setText("페이지에서 인증번호를 입력하세요 : " + authKey);
				mailSender.send(message);
			}catch(Exception e) {
				System.out.println("fail : " + e.getMessage());
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("authKey", authKey);
			return jsonObject.toJSONString();
		}
		
		// 휴대폰 인증 ajax
		@SuppressWarnings("unchecked")
		@RequestMapping(value="searchPwByPhone", produces="application/json")
		@ResponseBody
		public String searchByPhone(HttpServletRequest request, Model model) {
			String uId_ = request.getParameter("uId_");
			String uName = request.getParameter("uName");
			UserDao uDao = sqlSession.getMapper(UserDao.class);
			UserDto uDto = uDao.searchUserInfo(uId_, uName);
			String uPhone = uDto.getuPhone().replaceAll("-", "");
			
			String api_key = "";
			String api_secret = "";
			Message coolsms = new Message(api_key, api_secret);
			
			int authKey = (int)(Math.random() * 1000000) + 1234567;
			
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", uPhone);
			params.put("from", "");
			params.put("type", "SMS");
			params.put("text", "인증번호 [" + authKey + "] 입니다.");
			params.put("app_version", "test app 1.2");
			try {
				JSONObject obj = (JSONObject)coolsms.send(params);
				System.out.println(obj.toString());
				System.out.println(authKey);
			} catch (CoolsmsException e) {
			      System.out.println(e.getMessage());
			      System.out.println(e.getCode());
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("authKey", authKey);
			return jsonObject.toJSONString();
		}
	
	// 단순이동
	@RequestMapping("pwCheckPage") // mapping 값 수정
	public String checkPw() {
		return "user/checkPwPage";
	}
	
	@RequestMapping("modifyPage") // mapping 값 수정
	public String goModify() {
		return "user/modifyPage";
	}
	
	@RequestMapping("mainPage") // mapping 값 수정
	public String goMain() {
		return "home";
	}
	
	@RequestMapping("idFindPage") // mapping 값 수정
	public String goIdFind() {
		return "finds/idFind";
	}
	
	@RequestMapping("searchPwForm") // mapping 값 수정
	public String goPwFind() {
		return "searchPw/writeInfo";	// return 값 수정
	}
	
	// mapping 추가
	@RequestMapping("pwChangePage")	// mapper 때문에 유일하게 이동페이지에 request, model 추가
	public String PwChange(@RequestParam("uId_") String uId_, Model model) {
		model.addAttribute("uId_", uId_);
		return "finds/pwFindResult";
	}
	
	// 회원가입
	@RequestMapping("join_memberPage") // mapping 값 수정
	public String goJoin() {
		return "user/joinPage";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("loginPage")
	public String loginPage(HttpServletRequest request) {
		referrer = request.getHeader("Referer");
		return "user/loginPage";
	}
	
}
