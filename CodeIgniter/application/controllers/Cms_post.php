<?PHP

/**
 * post management. 
 * Content Management System of Vein`s Blog.
 * Author: vein1992@163.com
*/
class Cms_post extends MY_Controller {

	public function index() {
        $this->mysmarty->assign('tplData', $this->tplData);
		$this->mysmarty->display('backend/post.tpl');
	}

    /**
     * post add.
     */
    public function add() {
        $this->mysmarty->assign('tplData', $this->tplData);
        print_r($this->tplData);
        $this->mysmarty->display('backend/post-add.tpl'); 
    }

    public function addHandler() {
         
    }


}
?>
