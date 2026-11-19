Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EB606AA55
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2zhWAGn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Amw1fS1XfiTeMTqc1Cu798J9a9rOr5rpBCsgkAvG0x8=; b=J2zhWAGn/sjYRd7ty7a65YaPX2
	dQHQpCO0vfsOf6qoKncdepenq+MaplOphRfgA5RCMl4EnkzMlyFr6F3H4nMY90r7DpzOCIFmr1pqe
	92eFBN58tP41S0ZyDxDLcmiOF0Y02a3mNhm9+v6QaoWlJ2YMlPxPd1tX+wfNJAmVXwbOknrzR6RlO
	JK6Xzef+sCRGu+JTOf8HLNOsg98OrS3kz4ydwzTk3W4tWS4OJ74Ax5w9NNYYH+LxCW712b/O7UYXF
	0jHpqUBXAU5+sYeEOf1bTBmRNnV8R8A28hKuphPGVSp3LPsyRVVbBietxB9ajncsoEz6CIQhBFE3j
	wBtAE75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Bi-0000000C2gv-2JHq;
	Thu, 19 Nov 2026 13:28:30 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BX-0000000C2Qd-2WLd;
	Thu, 19 Nov 2026 13:28:21 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jVfRK1ktVz52SG3;
	Thu, 19 Nov 2026 21:27:57 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 6AJDRsH9086413;
	Thu, 19 Nov 2026 21:27:54 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:58 +0800
X-Zmail-TransId: 3e816afef95d02f-56508
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: [RFC PATCH v3 07/10] iommufd: Add RISC-V IOMMU hardware info type
Date: Thu, 19 Nov 2026 21:27:41 +0800
Message-ID: <20261119132744.396426-8-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6AJDRsH9086413
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 19 Nov 2026 21:27:57 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF95D.000/4jVfRK1ktVz52SG3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052819_865891_F90DE283 
X-CRM114-Status: GOOD (  12.13  )
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wu Fei <wu.fei9@sanechips.com.cn>

A VMM needs the physical IOMMU capabilities to decide which features
it can expose to a guest. Define IOMMU_HW_INFO_TYPE_RISCV and struct
iommu_hw_info_riscv so IOMMU_GET_HW_INFO can return the RISC-V
capabilities register.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 include/uapi/linux/iommufd.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index fee63e6cbb7a..adc7f30b2b18 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -733,6 +733,28 @@ struct iommu_hw_info_amd {
 	__aligned_u64 efr2;
 };
 
+/**
+ * struct iommu_hw_info_riscv - RISC-V IOMMU device info
+ *                              (IOMMU_HW_INFO_TYPE_RISCV)
+ *
+ * @capabilities: Value of the RISC-V IOMMU capabilities register, defined
+ *                in "IOMMU capabilities (capabilities)" of the RISC-V
+ *                IOMMU Architecture Specification. The value is reported
+ *                raw by the hardware.
+ *
+ * The VMM is responsible to determine the appropriate fields to be
+ * exposed to the VM since certain features are not currently supported
+ * by the kernel for nested domains. Current list of supported fields:
+ * - capabilities[Sv39, Sv48, Sv57, END, AMO_HWAD]
+ *
+ * This list may expand in the future. It is important that VMMs do not
+ * expose bits outside the list to the VM, to allow for compatibility
+ * with future kernels.
+ */
+struct iommu_hw_info_riscv {
+	__aligned_u64 capabilities;
+};
+
 /**
  * enum iommu_hw_info_type - IOMMU Hardware Info Types
  * @IOMMU_HW_INFO_TYPE_NONE: Output by the drivers that do not report hardware
@@ -743,6 +765,7 @@ struct iommu_hw_info_amd {
  * @IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV (extension for ARM
  *                                     SMMUv3) info type
  * @IOMMU_HW_INFO_TYPE_AMD: AMD IOMMU info type
+ * @IOMMU_HW_INFO_TYPE_RISCV: RISC-V IOMMU info type
  */
 enum iommu_hw_info_type {
 	IOMMU_HW_INFO_TYPE_NONE = 0,
@@ -751,6 +774,7 @@ enum iommu_hw_info_type {
 	IOMMU_HW_INFO_TYPE_ARM_SMMUV3 = 2,
 	IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV = 3,
 	IOMMU_HW_INFO_TYPE_AMD = 4,
+	IOMMU_HW_INFO_TYPE_RISCV = 5,
 };
 
 /**
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
