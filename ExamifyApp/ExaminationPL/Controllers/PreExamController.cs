//
// using ExaminationBLL.Feature.Interface;
// using ExaminationBLL.Feature.Repository;
// using Microsoft.AspNetCore.Mvc;
//
// namespace ExaminationPL.Controllers
// {
//     public class PreExamController : Controller
//     {
//         readonly IpreExam preExamManager;
//
//         public PreExamController(IpreExam _preExamManager)
//         {
//             preExamManager = _preExamManager;
//         }
//         public IActionResult PreExamView()
//         {
//             int? UserId = HttpContext.Session.GetInt32("UserId");
//             int? RoleID = HttpContext.Session.GetInt32("RoleId");
//
//             var Exam = preExamManager.GetExamByStudentId(UserId);
//
//             if (UserId != null && RoleID !=null && RoleID==2)
//             {
//
//                 return View("PreExamView", Exam);
//             }
//             return RedirectToAction("Login", "Account",Exam);
//         }
//
//         public IActionResult StudentProfile() 
//         {
//             int? UserId = HttpContext.Session.GetInt32("UserId");
//             int? RoleID = HttpContext.Session.GetInt32("RoleId");
//             var student = preExamManager.GetStudentById(UserId);
//             return View("StudentProfile", student);
//         }
//     }
// }
