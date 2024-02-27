using ExaminationBLL.Mapping.DTOs;

namespace ExaminationBLL.Feature.Interface;

public interface IQuestionRepository
{
    IEnumerable<IncludeDTO> GetAllQuestionsByExamId(int examId);
}