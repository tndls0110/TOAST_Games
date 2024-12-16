package com.toast.approval.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.toast.approval.service.ApprovalService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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

	@PostMapping(value = "/approval_doc_write.ajax")
	@ResponseBody
	public String approval_doc_write(Model model,String data) {
		//Map<String, Object> data = new HashMap<String, Object>();

		//바로 값을 다른 뷰로 보내기
		model.addAttribute("data", data);
		return "approval_write";
	}
}
