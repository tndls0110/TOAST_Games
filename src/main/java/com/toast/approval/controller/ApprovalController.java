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
	public Map<String, Object> approvalForm(String subject) {
		Map<String, Object> data = approvalService.form(subject);
		return data;
	}



	@RequestMapping (value = "/approval_write.go")
	public String approvalWrite_go (Model model, int form_idx, String form_content) {
		logger.info("approvalWrite_go 컨트롤러 도착");
		logger.info("idx: " + form_idx);
		logger.info("content: " + form_content);

		//세션 처리
		String login_id = "rrarro845";

		//작성하기
			//작성하기부터는 update로 하기
		approvalService.doc_write(form_idx,form_content,login_id);
		


		model.addAttribute("form_content", form_content);
		model.addAttribute("form_idx", form_idx);

		return "approval_write";
	}



}
