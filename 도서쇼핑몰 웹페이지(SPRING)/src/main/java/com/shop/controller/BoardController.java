package com.shop.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.model.BoardImageVO;
import com.shop.model.BoardVO;
import com.shop.model.Criteria;
import com.shop.model.PageDTO;
import com.shop.model.ReplyVO;
import com.shop.service.BoardService;
import com.shop.service.ReplyService;

@Controller
public class BoardController {
	
	
	private final BoardService boardService;
	private final ReplyService replyService;
	
	
	
	@Inject
	public BoardController(BoardService boardService,ReplyService replyService) {
		this.boardService=boardService;
		this.replyService=replyService;
	}
	
	
	
	 //목록페이지이동
    @RequestMapping(value="bbs", method =RequestMethod.GET )
    public String bbsGET(Criteria cri,Model model) throws Exception{
    	
    	 /*  목록 출력 데이터 */
        model.addAttribute("list",boardService.listAll(cri));
        

       
        /* 페이지 이동 인터페이스 데이터 */
        model.addAttribute("pageMaker", new PageDTO(cri, boardService.writerGetTotal(cri)));
        
    	return "/bbs";
    	
    }
	
    /* 글 등록 페이지 이동 */
    @RequestMapping(value = "/bbswrite", method = RequestMethod.GET)
    public String bbswriteGET() {
        return "/bbswrite";
    }
	
     // 글등록 처리 
    @RequestMapping(value = "/bbswrite", method = RequestMethod.POST) 
    public String bbswritePOST(BoardVO boardVO, RedirectAttributes rttr) throws Exception { 
    	
    boardService.create(boardVO);
    rttr.addFlashAttribute("msg", "regSuccess");
    
    return "redirect:/bbs"; 
    }
    
   
    
    //상세조회 페이지 이동
  @RequestMapping(value="/bbsread", method =RequestMethod.GET )
   public String read(@RequestParam("boardid") int boardid,Criteria cri,Model model) throws Exception{
	   
	  model.addAttribute("cri", cri);
	   
	   model.addAttribute("list", boardService.read(boardid));
	   
	   List<ReplyVO> replyList=replyService.list(boardid);
	   model.addAttribute("replyList", replyList);
	   
	 return "/bbsread";
   }
   
   
 //수정 페이지 이동
   @RequestMapping(value="/bbsmodify", method =RequestMethod.GET )
   public String bbsmodifyGET(@RequestParam("boardid") int boardid, Model model) throws Exception{
	   
	 
	  model.addAttribute("list", boardService.read(boardid));
	  
	   
	   return "/bbsmodify";
   }
   
 //수정 처리
   @RequestMapping(value="/bbsmodify", method =RequestMethod.POST )
   public String bbsmodifyPOST(BoardVO boardVO,RedirectAttributes rttr) throws Exception{
	   
	 boardService.update(boardVO);
	
	  rttr.addFlashAttribute("msg", "modSuccess");
	   
	   return "redirect:/bbs";
   }

 //삭제 처리
   @RequestMapping(value="/remove",method =RequestMethod.POST )
   public String remove(@RequestParam("boardid") int boardid, RedirectAttributes rttr) throws Exception{
	  
		
	   boardService.delete(boardid);
	   rttr.addFlashAttribute("msg", "delSuccess");
	   
	   return "redirect:/bbs";
   }
	//댓글 작성
   @RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO replyVO, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		
		replyService.create(replyVO);
		
		rttr.addAttribute("boardid", replyVO.getBoardid());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/bbsread";
	}
 //댓글 수정 GET
 	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
 	public String replyUpdateView(ReplyVO replyVO, Criteria cri, Model model) throws Exception {
 		
 		
 		model.addAttribute("replyUpdate", replyService.selectReply(replyVO.getReplyno()));
 		model.addAttribute("cri", cri);
 		
 		return "/replyUpdateView";
 	}
 	
 	//댓글 수정 POST
 	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
 	public String replyUpdate(ReplyVO replyVO, Criteria cri, RedirectAttributes rttr) throws Exception {
 	
 		
 		replyService.update(replyVO);
 		
 		rttr.addAttribute("boardid", replyVO.getBoardid());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
 		
 		return "redirect:/bbsread";
 	}
 	//댓글 삭제 GET
 		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
 		public String replyDeleteView(ReplyVO replyVO, Criteria cri, Model model) throws Exception {
 			
 			
 			model.addAttribute("replyDelete", replyService.selectReply(replyVO.getReplyno()));
 			model.addAttribute("cri", cri);
 			

 			return "/replyDeleteView";
 		}
 		
 		//댓글 삭제
 		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
 		public String replyDelete(ReplyVO replyVO, Criteria cri, RedirectAttributes rttr) throws Exception {
 			
 			
 			replyService.delete(replyVO);;
 			
 			rttr.addAttribute("boardid", replyVO.getBoardid());
 			rttr.addAttribute("pageNum", cri.getPageNum());
 			rttr.addAttribute("amount", cri.getAmount());
 			rttr.addAttribute("type", cri.getType());
 			rttr.addAttribute("keyword", cri.getKeyword());
 			
 			return "redirect:/bbsread";
 		}
 		
 		/* 첨부 파일 업로드 */
 		@PostMapping(value="/buploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
 		public ResponseEntity<List<BoardImageVO>> buploadAjaxActionPOST(MultipartFile[] uploadFile) {
 			/* 이미지 파일 체크 */
 			for(MultipartFile multipartFile: uploadFile) {
 				
 				File checkfile = new File(multipartFile.getOriginalFilename());
 				String type = null;
 				
 				try {
 					type = Files.probeContentType(checkfile.toPath());
 					
 				} catch (IOException e) {
 					e.printStackTrace();
 				}
 				if(!type.startsWith("image")) {
 					
 					List<BoardImageVO> list = null;
 					return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
 				}
 				
 			}
 			String uploadFolder = "C:\\upload";
 			
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 			
 			Date date = new Date();
 			
 			String str = sdf.format(date);
 			
 			String datePath = str.replace("-", File.separator);
 			
 			/* 폴더 생성 */
 			File uploadPath = new File(uploadFolder, datePath);
 			
 			
 			if(uploadPath.exists() == false) {
 				uploadPath.mkdirs();
 			}
 			List<BoardImageVO> list = new ArrayList();
 			for(MultipartFile multipartFile :uploadFile) {
 				
 				BoardImageVO vo=new BoardImageVO();
 			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
		
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 생성(ImageIO) */
				
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); 
				
				BufferedImage bo_image = ImageIO.read(saveFile);
					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);				
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width,height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);	
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
 		}
 			ResponseEntity<List<BoardImageVO>> result = new ResponseEntity<List<BoardImageVO>>(list, HttpStatus.OK);
 			return result;
 		}
 		
 		/* 이미지 파일 삭제 */
 		@PostMapping("/bdeleteFile")
 		public ResponseEntity<String> deleteFile(String fileName){
 			
 			File file=null;
 			
 			try {
 				
 				/* 썸네일 파일 삭제 */
 				file = new File("C:\\upload" + URLDecoder.decode(fileName, "UTF-8"));
 				
 				file.delete();
 				
 				/* 원본 파일 삭제 */
 				String originFileName = file.getAbsolutePath().replace("s_", "");
 				
 				
 				
 				file = new File(originFileName);
 				
 				file.delete();
 				
 			} catch(Exception e) {
 				
 				e.printStackTrace();
 				
 				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
 				
 			}
 			return new ResponseEntity<String>("success", HttpStatus.OK);
 	}
 		
}
