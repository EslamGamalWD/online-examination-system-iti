using ExaminationBLL.Feature.Interface;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers
{
    public class ResultController : Controller
    {
        private readonly IGetExamResultRepo _resultRepo;
        public ResultController(IGetExamResultRepo _resultRepo)
        {
            this._resultRepo = _resultRepo;
        }
        public IActionResult Index(int id)
        {
            //int? UserId = HttpContext.Session.GetInt32("UserId");
            //if(UserId != null)
            //{
              return View(_resultRepo.Get(id, 7));
            //}
            //return RedirectToAction("Login", "Account");
        }
    }
}
