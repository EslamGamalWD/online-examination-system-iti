using ExaminationBLL.ModelVM.UserVM;
using Examination.DAL.Entities;

namespace ExaminationBLL.Mapping.UserMapping
{
    public class UserMapper
    {
        public UserVM Mapping(User user)
        {
            var userVM = new UserVM
            {
                UserId = user.UserId,
                RoleId = user.RoleId,
            };
            return userVM;
        }
    }
}
