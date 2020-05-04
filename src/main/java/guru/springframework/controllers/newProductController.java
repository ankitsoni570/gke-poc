package guru.springframework.controllers;

import java.io.IOException;
import java.io.Writer;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import io.prometheus.client.CollectorRegistry;
import io.prometheus.client.Counter;
import io.prometheus.client.exporter.common.TextFormat;

@Controller
public class newProductController {

	/*
	 * public static Counter ProductRequestsNew = Counter.build()
	 * .name("requests_total").help("Total requests.").register();
	 * 
	 * 
	 * @RequestMapping("product/new") public String newProduct(Model model){
	 * ProductRequestsNew.inc(); model.addAttribute("product", new Product());
	 * return "productform"; }
	 * 
	 * @RequestMapping(path = "/product-metric-new") public void metrics(Writer
	 * responseWriter) throws IOException { TextFormat.write004(responseWriter,
	 * CollectorRegistry.defaultRegistry.metricFamilySamples());
	 * responseWriter.close(); }
	 */
}
