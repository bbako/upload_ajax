package org.hy.cont;

import java.io.FileInputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/display")
public class DisplayController {
	
	@GetMapping(produces = { "image/jpg" })
	@ResponseBody
	public byte[] display(String fName) throws Exception {

		if (fName == "") {

			fName = "1.jpg";

		}
		FileInputStream fin = new FileInputStream("C:\\testUP\\" + fName);

		byte[] arr = IOUtils.toByteArray(fin);
		return arr;

	}

}
