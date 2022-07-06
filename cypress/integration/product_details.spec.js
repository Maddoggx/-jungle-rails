
describe("home page", () => {
  
  beforeEach(() => {
    cy.visit("/");
  });

  it("should render products", () => {
    cy.visit("/products");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  // it("Shoud navigate to product display page", () => {
  //   cy.get("article")
  //     .first()
  //     .click();
  //   cy.contains("Scented Blade")
  // });
})