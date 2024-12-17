package com.toast.approval.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.toast.approval.service.ApprovalService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.Map;

@Controller
public class ApprovalController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ApprovalService approvalService;
	
	public ApprovalController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@RequestMapping (value = "/")
	public String main () {
		return "approval_writing_list";
	}

	@RequestMapping (value = "/approval_form_list.go")
	public String approvalFormList_go () {
		return "approval_form_list";
	}

	@GetMapping (value = "/approval_form_list.ajax")
	@ResponseBody
	public Map<String, Object> approvalFormList () {
		Map<String, Object> data = new HashMap<>();
		data.put("list",approvalService.form_list());
		return data;
	}

	@GetMapping (value = "/approval_form.ajax")
	@ResponseBody
	public Map<String, Object> approvalForm(int form_idx) {
		Map<String, Object> data = approvalService.form(form_idx);
		return data;
	}



	@PostMapping (value = "/approval_write.go")
	public String approvalWrite_go (Model model, String form_idx) {
		logger.info("approvalWrite_go 컨트롤러 도착");
		logger.info("idx:{}", form_idx);
		//세션 처리
		//int empl_idx = 10002;

		//작성하기
			//작성하기부터는 update로 하기
		//int doc_idx = approvalService.doc_write(form_idx,form_content,empl_idx);
		


		//model.addAttribute("form_content", form_content);
		//model.addAttribute("doc_idx", doc_idx);
		model.addAttribute("form_idx", form_idx);


		return "approval_write";
	}

/*	@GetMapping (value = "/doc_get.ajax")
	@ResponseBody
	public Map<String,Object> doc_get (int doc_idx) {
		logger.info("doc_get.ajax 컨트롤러 도착");
		logger.info("doc_idx: " + doc_idx);
		Map<String,Object> data = approvalService.doc_get(doc_idx);
		return data;
	}*/
}
