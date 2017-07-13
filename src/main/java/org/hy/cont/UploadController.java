package org.hy.cont;


import java.io.File;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class UploadController {
	Logger logger = Logger.getLogger(UploadController.class);

	@GetMapping
	public void upload() {

	}

	@PostMapping(produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String sendfile(MultipartFile[] file) throws Exception {

		logger.info("들어오고");
	
		for(int i=0;i<file.length;i++){
		
		String saveName = "test_"+file[i].getOriginalFilename();
		
		File target = new File("c:\\testUP",saveName);
		
		FileCopyUtils.copy(file[i].getBytes(), target);
		
		}
		
		return "success";
		
	}

}
