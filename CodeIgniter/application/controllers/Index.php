<?php

class Index extends MY_Controller {

	public function first() {
		$this->mysmarty->display('blog/index.tpl');
		//$template_dir = $this->mysmarty->getTemplateDir();
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/Welcome.php */
