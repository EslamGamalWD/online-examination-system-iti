using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Feature.Repository;
using ExaminationBLL.Mapping.DepartmentMapp;
using ExaminationBLL.ModelVM.Department;
using ExaminationDAL.Entities;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers
{
    public class DepartmentController : Controller
    {
        private readonly IDepartmentRepo _departmentRepo;
        private readonly DepartmentMapper _departmentMapper;

        public DepartmentController(IDepartmentRepo departmentRepo, DepartmentMapper departmentMapper)
        {
            _departmentMapper = departmentMapper;
            _departmentRepo = departmentRepo;
        }

        public IActionResult DisplayDepartments()
        {
            List<DepartmentVM> departments = new List<DepartmentVM>();
            departments = _departmentRepo.GetAllDepartments();
            return View("DisplayDepartments", departments);
        }

        public IActionResult GetEmployeeById(int id)
        {
            var department = _departmentRepo.GetById(id);
            return View("GetEmployeeById", department);
        }

        public IActionResult Create()
        {
            var departmentVM = new DepartmentVM()
            {
                Instructors = _departmentRepo.GetAllInstructors()
            };
            return View("Create", departmentVM);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(DepartmentVM department)
        {
            if (!ModelState.IsValid)
            {
                department.Instructors = _departmentRepo.GetAllInstructors();
                return View(department);
            }

            var departmentEntity = new Department
            {
                DeptName = department.DeptName,
                DeptDesc = department.DeptDesc,
                DeptLocation = department.DeptLocation,
                DeptMgrId = department.DeptMgrId,
                MgrHireDate = department.MgrHireDate
            };

            _departmentRepo.AddDepartment(departmentEntity);

            return RedirectToAction(nameof(DisplayDepartments));
        }

        public IActionResult Edit(int id)
        {
            if (id == null)
                return BadRequest();

            var department = _departmentRepo.GetById(id);

            var departmentVM = new DepartmentVM()
            {
                DeptId = department.DeptId,
                DeptName = department.DeptName,
                DeptDesc = department.DeptDesc,
                DeptLocation = department.DeptLocation,
                DeptMgrId = department.DeptMgrId,
                MgrHireDate = department.MgrHireDate,
                Instructors = _departmentRepo.GetAllInstructors()
            };

            if (department == null)
                return NotFound();

            return View("Edit", departmentVM);
        }


        [HttpPost]
        
        public IActionResult Edit(DepartmentVM departmentVM)
        {
            if (ModelState.IsValid)
            {
                _departmentRepo.UpdateDepartment(departmentVM);

                return RedirectToAction(nameof(DisplayDepartments));
            }

            departmentVM.Instructors = _departmentRepo.GetAllInstructors();
            return View(departmentVM);

           
        }




        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult Create(DepartmentVM department)
        //{


        //    try
        //    {

        //        var departmentEntity = new Department
        //        {
        //            DeptName = department.DeptName,
        //            DeptDesc = department.DeptDesc,
        //            DeptLocation = department.DeptLocation,
        //            DeptMgrId = department.DeptMgrId,
        //            MgrHireDate = department.MgrHireDate
        //        };

        //        _departmentRepo.AddDepartment(departmentEntity);

        //        return RedirectToAction(nameof(DisplayDepartments));
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log or handle the exception
        //        ModelState.AddModelError(string.Empty, "Error occurred while saving department.");
        //        return View(department);
        //    }
        //}

    }
}
