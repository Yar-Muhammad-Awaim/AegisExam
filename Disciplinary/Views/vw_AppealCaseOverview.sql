CREATE VIEW [Disciplinary].[vw_AppealCaseOverview]
AS
SELECT
    ap.AppealId,
    ap.Status AS AppealStatus,
    ap.SubmittedAt AS AppealSubmittedAt,
    s.SanctionId,
    s.SanctionType,
    s.IsActive AS IsSanctionActive,
    rv.ReviewId,
    rv.Outcome AS ReviewOutcome,
    rv.ReviewDate,
    st.StudentId,
    p.FirstName,
    p.LastName,
    p.Email,
    latestReview.AppealReviewId AS LatestAppealReviewId,
    latestReview.Decision AS LatestDecision,
    latestReview.ReviewedAt AS LatestDecisionAt
FROM [Disciplinary].Appeal AS ap
INNER JOIN [Disciplinary].Sanction AS s
    ON s.SanctionId = ap.SanctionId
INNER JOIN [Disciplinary].Review AS rv
    ON rv.ReviewId = s.ReviewId
INNER JOIN [Identity].Student AS st
    ON st.StudentId = ap.StudentId
INNER JOIN [Identity].Person AS p
    ON p.PersonId = st.PersonId
OUTER APPLY
(
    SELECT TOP (1)
        ar.AppealReviewId,
        ar.Decision,
        ar.ReviewDate AS ReviewedAt
    FROM [Disciplinary].AppealReview AS ar
    WHERE ar.AppealId = ap.AppealId
    ORDER BY ar.ReviewDate DESC, ar.AppealReviewId DESC
) AS latestReview;
GO

