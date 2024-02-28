using ExaminationBLL.ModelVM.GenerateVM.Validation;
using ExaminationDAL.Entities;
using ExaminationBLL.ModelVM.GenerateVM;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExaminationBLL.ModelVM.GenerateVM
{
    public class GenerateExam
    {
        [Key]
        public int CourseID { get; set; }
       
        [CheckDecimal]

        public string trueOrFalseCounnt { get; set; }
        [CheckDecimal]

        public string otherQuestionCount { get; set; }
        public List<StudentGenerateExamVM>? StId { get; set; }
       
    }
}
