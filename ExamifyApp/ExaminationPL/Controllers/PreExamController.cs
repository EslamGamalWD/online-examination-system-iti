﻿
using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Feature.Repository;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers
{
    public class PreExamController : Controller
    {
        readonly IpreExam preExamManager;
        int? UserId;
        int? RoleID;
        public PreExamController(IpreExam _preExamManager)
        {
            preExamManager = _preExamManager;
        }
        public IActionResult PreExamView()
        {
            UserId = HttpContext.Session.GetInt32("UserId");
            RoleID = HttpContext.Session.GetInt32("RoleId");

            var Exam = preExamManager.GetExamByStudentId(UserId);

            if (UserId != null && RoleID != null && RoleID == 2)
            {
                if(CheckExam())
                {
                    return View("ExamDisabled");
                }
                return View("PreExamView", Exam);
            }
            return RedirectToAction("Login", "Account", Exam);
        }

        public IActionResult StudentProfile()
        {
            int? UserId = HttpContext.Session.GetInt32("UserId");
            int? RoleID = HttpContext.Session.GetInt32("RoleId");
            var student = preExamManager.GetStudentById(UserId);
            return View("StudentProfile", student);
        }

        public IActionResult CheckIfStudentHasExam()
        {
            if(CheckExam())
            {
                return View("ExamDisabled");
            }
           
            return RedirectToAction(nameof(PreExamView));
        }

        public bool CheckExam() => preExamManager.GetExamByStudentId(UserId) is null;
           
        
    }
}
