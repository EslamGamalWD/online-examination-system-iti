using ExaminationDAL.Entities;
using ExaminationBLL.Mapping.DTOs;

namespace ExaminationBLL.ModelVM.ExamVM;

public class CurrentExamViewModel
{
    public Exam Exam { get; set; }
    public IEnumerable<IncludeDTO> Questions { get; set; }

    public CurrentExamViewModel(Exam exam, IEnumerable<IncludeDTO> questions)
    {
        Exam = exam;
        Questions = questions;
    }
}