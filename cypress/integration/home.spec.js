describe ('home page', () => {
  it ('should display the home page', () => {
    cy.visit ('/');
  });

  it ('should display products on the home page' , () => {
    cy.get ('.products article').should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});