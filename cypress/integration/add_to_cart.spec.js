describe("home page test", () => {
  
  beforeEach(() => {
    cy.visit("/");
  });

  it("should visit products", () => {
    cy.visit("/products");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Shoud add items to cart", () => {
    cy.contains("My Cart (0)")
    cy.get(".btn")
      .first()
      .click({force: true});
    cy.contains("My Cart (1)")
  });
})