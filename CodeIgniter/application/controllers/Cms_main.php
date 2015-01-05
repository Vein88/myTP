<?PHP

/**
 * Content Management System of Vein`s Blog.
 * Author: vein1992@163.com
*/
class Cms_main extends MY_Controller {

	public function index() {
		$this->mysmarty->display('backend/index.tpl');
	}

	public function global_manage() {
		$this->mysmarty->display('backend/global_manage.tpl');
	}

}
?>
