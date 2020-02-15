package com.bcgbcg.br;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcgbcg.br.command.BoardCommand;
import com.bcgbcg.br.command.BookChartCommand;
import com.bcgbcg.br.command.BookChartListCommand;
import com.bcgbcg.br.command.BooksByGradeCommand;
import com.bcgbcg.br.command.BooksByNumOfReviewCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	private BookChartCommand bookChartCommand;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		
		bookChartCommand = new BookChartListCommand();
		bookChartCommand.execute(sqlSession, model);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
