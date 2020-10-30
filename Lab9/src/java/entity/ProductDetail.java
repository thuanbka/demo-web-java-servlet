/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PhongVu
 */
@Entity
@Table(name = "product_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductDetail.findAll", query = "SELECT p FROM ProductDetail p  order by p.productId DESC")
    , @NamedQuery(name = "ProductDetail.findByProductId", query = "SELECT p FROM ProductDetail p WHERE p.productId = :productId")
    , @NamedQuery(name = "ProductDetail.findByInforrmation", query = "SELECT p FROM ProductDetail p WHERE p.inforrmation = :inforrmation")
    , @NamedQuery(name = "ProductDetail.findByImage1", query = "SELECT p FROM ProductDetail p WHERE p.image1 = :image1")
    , @NamedQuery(name = "ProductDetail.findByImage2", query = "SELECT p FROM ProductDetail p WHERE p.image2 = :image2")
    , @NamedQuery(name = "ProductDetail.findByImage3", query = "SELECT p FROM ProductDetail p WHERE p.image3 = :image3")
    , @NamedQuery(name = "ProductDetail.findByImage4", query = "SELECT p FROM ProductDetail p WHERE p.image4 = :image4")
    , @NamedQuery(name = "ProductDetail.findByImage5", query = "SELECT p FROM ProductDetail p WHERE p.image5 = :image5")
    , @NamedQuery(name = "ProductDetail.findByAccessories", query = "SELECT p FROM ProductDetail p WHERE p.accessories = :accessories")
    , @NamedQuery(name = "ProductDetail.findByGuaranty", query = "SELECT p FROM ProductDetail p WHERE p.guaranty = :guaranty")})
public class ProductDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_id")
    private Integer productId;
    @Size(max = 2000)
    @Column(name = "inforrmation")
    private String inforrmation;
    @Size(max = 255)
    @Column(name = "image1")
    private String image1="";
    @Size(max = 255)
    @Column(name = "image2")
    private String image2="";
    @Size(max = 255)
    @Column(name = "image3")
    private String image3="";
    @Size(max = 255)
    @Column(name = "image4")
    private String image4="";
    @Size(max = 255)
    @Column(name = "image5")
    private String image5="";
    @Size(max = 2000)
    @Column(name = "accessories")
    private String accessories;
    @Size(max = 2000)
    @Column(name = "guaranty")
    private String guaranty;

    public ProductDetail() {
    }

    public ProductDetail(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getInforrmation() {
        return inforrmation;
    }

    public void setInforrmation(String inforrmation) {
        this.inforrmation = inforrmation;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public String getAccessories() {
        return accessories;
    }

    public void setAccessories(String accessories) {
        this.accessories = accessories;
    }

    public String getGuaranty() {
        return guaranty;
    }

    public void setGuaranty(String guaranty) {
        this.guaranty = guaranty;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductDetail)) {
            return false;
        }
        ProductDetail other = (ProductDetail) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductDetail[ productId=" + productId + " ]";
    }
   public int getNumberImage()
   {
       int dem=0;
       if(image1!=null)
       {
           dem++;
       }
       if(image2!=null)
       {
           dem++;
       }
       if(image3!=null)
       {
           dem++;
       }
       if(image4!=null)
       {
           dem++;
       }
       if(image5!=null)
       {
           dem++;
       }
       return dem;
   }
   public String getImage(int i) {
       String imageString="";
        switch(i)
        {
            case 1:imageString=getImage1();break;
            case 2:imageString=getImage2();break;
            case 3:imageString=getImage3();break;
            case 4:imageString=getImage4();break;
            case 5:imageString=getImage5();break;
        }
        return imageString;
    }
   
   
}
