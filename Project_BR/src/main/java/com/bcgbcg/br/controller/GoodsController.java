package com.bcgbcg.br.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.command.GoodsCommand;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.UploadFileUtils;

@Controller
public class GoodsController {

	@Autowired
	private GoodsCommand goodsCommand;
	
	@RequestMapping(value="goodsPayStateMent")
	public String goodsPayStateMent(Model model) { 

		return "goods/goodsPayStateMent";
	}
	
	@RequestMapping("adminGoodsPage")
	public String adminGoods(Model model) {
		return "goods/adminGoods";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="GoodsPostPage" , method = RequestMethod.POST)
	public String postGoods(GoodsDto gdto, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);  
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

		gdto.setgImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		goodsCommand.Goods(gdto);
		
		return "redirect:/adminGoodsViewPage";
	}

	@RequestMapping("adminGoodsViewPage")
	public String GoodsList(Model model) throws Exception {
		
		goodsCommand.GoodsSoldOut();
		List<GoodsDto> list = goodsCommand.Goodslist();  
		
		model.addAttribute("list", list);  
		return "goods/adminGoodsView";
	}
	
	@RequestMapping("goodsViewPage")
	public String GoodsUserList(Model model) throws Exception {
		
		goodsCommand.GoodsSoldOut();
		List<GoodsDto> list = goodsCommand.Goodslist();  
		
		model.addAttribute("list", list);  
		return "goods/goodsView";
	}
	
	@RequestMapping(value="adminGoodsModifyPage" , method = RequestMethod.GET) 	
	public String GoodsDes(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
	
		GoodsDto gdto = goodsCommand.GoodsDes(gIdx);
		
		model.addAttribute("gdto", gdto);
		
		return "goods/adminGoodsModify";
	}
	
	@RequestMapping(value="adminModifyRegPage", method = RequestMethod.POST)
	public String GoodsModify(GoodsDto gdto) throws Exception {
		goodsCommand.GoodsModify(gdto);
		goodsCommand.GoodsSoldOut();
		
		return "redirect:/adminGoodsViewPage";
	}
	
	@RequestMapping("adminGoodsDeletePage")
	public String GoodsDelete(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
		
		goodsCommand.GoodsDelete(gIdx);
		
		return "redirect:/adminGoodsViewPage";
	}
	
	@RequestMapping("goodsBuyPage")
	public String GoodsBuyDes(@RequestParam("gIdx") int gIdx , Model model) throws Exception {

		GoodsDto gdto = goodsCommand.GoodsBuyMove(gIdx);
		model.addAttribute("gdto", gdto);
		
		return "goods/goodsBuyDes";
	}
	
	@RequestMapping("goodsPayPage")
	public String GoodsPayPage(@RequestParam("gIdx") int gIdx , Model model) throws Exception {

		GoodsDto gdto = goodsCommand.GoodsPayMove(gIdx);
		model.addAttribute("gdto", gdto);
		
		return "goods/goodsPayDes";
	}
	
	@RequestMapping(value="payDecision", method = RequestMethod.POST)
	public String PayDecision(@RequestParam("gIdx") int gIdx,
							  @RequestParam("gPrice") int gPrice,
							  @RequestParam("uIdx") int uIdx,
							  @RequestParam("uId_") String uId_,
							  PurchaseDto pdto,
							  HttpServletRequest request,
							  RedirectAttributes rttr,
							  Model model) throws Exception {

		goodsCommand.PayDecision(gIdx); // 재고수량 1개 빠짐.
		goodsCommand.PayDecision_User(gPrice, uIdx); //고객정보에서 포인트 차감
		goodsCommand.PurchaseInsert(pdto);	
		GoodsDto gdto = goodsCommand.GoodsDes(gIdx); // 물품정보 저장

		HttpSession session = request.getSession(); // 현재 세션 정보를 가져옴.
		session.setAttribute("gdto", gdto); // 구매한 물품값 넘기기
		session.setAttribute("pdto", pdto); // 배송정보 넘기기
		UserDto loginDto = new UserDto(); 
		session.removeAttribute("loginDto");
		loginDto = goodsCommand.loginUpdate(uIdx);
		session.setAttribute("loginDto", loginDto);	
	
		return "redirect:/goodsPayStateMent";
	}
}