﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable enable
using System;
using System.Collections.Generic;

namespace ExaminationDAL.Entities;

public partial class Exam
{
    public int ExId { get; set; }

    public string? ExName { get; set; }

    public decimal? ExFinalGrade { get; set; }

    public int? StId { get; set; }

    public virtual ICollection<Include> Includes { get; set; } = new List<Include>();

    public virtual Student? St { get; set; }
}