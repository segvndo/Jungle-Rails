describe ('home page', () => {
  it ('should display the home page', () => {
    cy.visit ('/');
  });

  it ('should confirm that the count of the cart button changes when adding products to it', () => {
    cy.contains ('My Cart (0)');
    cy.contains ('Add').first().click({force: true});
    cy.contains ('My Cart (1)');
  });
});
