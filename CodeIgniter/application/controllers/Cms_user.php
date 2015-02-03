<?PHP

/**
 *
 */
class Cms_user extends MY_Controller {

    public function list() {
        $this->mysmarty->display('backend/user.tpl'); 
    }

    public function add() {
        echo 'hed';
        $this->mysmarty->display('backend/user-add.tpl'); 
    }
} 
?>
