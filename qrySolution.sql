
/*
  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  *                                                               *
  *         #query- for searching and cases condition             * 
  *                                                               *
  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *                                           
*/

SELECT sm.`Id` as studId , CONCAT_WS(' ',sm.`FirstName` , sm.`MiddleName` , sm.`LastName`) AS fullName, sm.`FirstName` , sm.`MiddleName` , sm.`LastName`, acm.`ProgramFullName` , act.`SemesterName` , dm.`DivName` ,  sm.`RollNo` , sm.`FatherName` , sm.`MotherName` , 
-- case 
 (CASE WHEN ftm.id IS NULL THEN 0 ELSE 1 END ) AS disableDelete,
 
 (CASE WHEN ftm.id IS NULL THEN 0 ELSE 1 END ) AS disableEdit ,(CASE WHEN ftm.id IS NULL THEN 'Pending' ELSE 'Paid' END )AS feesStatus FROM `student_master` AS sm 
   LEFT JOIN `student_academic_details` AS sad ON sad.`StudId`  = sm.`Id` AND sad.`IsActive` = 1 AND sad.`IsDelete` = 0
   LEFT JOIN `fees_allotmentdetails` AS fa ON fa.`StudentUserId` = sm.`Id` AND fa.`IsActive` = 1 AND fa.`IsDelete` = 0 
  LEFT JOIN `fees_transaction_master` AS ftm ON ftm.`StudentId` = sm.`Id` AND ftm.`IsActive` = 1 AND ftm.`IsDelete` = 0 
  LEFT JOIN `academic_combination_tran_detail` AS actd ON actd.`Id` = sad.`AcadDetailId` AND actd.`IsActive` = 1 AND actd.`IsDelete` = 0 
  LEFT JOIN `academic_combination_tran` AS act ON act.`Id` = actd.`AcadCombTranId` AND act.`IsActive` = 1 AND act.`IsDelete` = 0
   LEFT JOIN `academic_combination_master` AS acm ON acm.`Id` = act.`AcadCombMasterId` AND acm.`IsActive` = 1 AND acm.`IsDelete` = 0 
   LEFT JOIN `organization_master` AS om ON om.`Id` = acm.`OrgId` AND om.`IsActive` = 1 AND om.`IsDelete` = 0 
   LEFT JOIN `division_master` AS dm ON dm.`Id` = actd.`DivisionId` AND sm.`IsActive` = 1 AND dm.`IsDelete` = 0
  
  WHERE sm.`IsActive` =  1 AND sm.`IsDelete` = 0 AND (act.`AcYearId` = :AcyearId OR :AcyearId = 0) AND (sad.`AcadDetailId` =:AcadDetailId OR :AcadDetailId = 0)  AND (act.`Id` = :AcadTranId OR :AcadTranId = 0) AND (acm.`Id` = :AcadCombId OR :AcadCombId = 0) AND (om.`Id` = :OrgId OR :OrgId = 0) AND
--    important-line is below
   CONCAT_WS(' ', sm.`FirstName`,sm.`LastName`) REGEXP :searchString  GROUP BY ftm.`StudentId` , sad.`StudId`, fa.`StudentUserId`;