using ExaminationBLL.ModelVM.UserVM;
using ExaminationDAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
